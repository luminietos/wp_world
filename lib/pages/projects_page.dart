import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/project_loader.dart';
import 'package:wp_world/helpers/localization_helpers.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/models/project.dart';
import 'package:wp_world/state/projects_filter_state.dart';
import 'package:wp_world/theme/app_colors.dart';
import 'package:wp_world/widgets/projects_filter_button.dart';
import 'package:wp_world/widgets/projects_filter_modal.dart';
import 'package:wp_world/widgets/project_card.dart';
import 'package:wp_world/widgets/responsive_grid.dart';
import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/utils/spacing.dart';

@RoutePage()
class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late final Future<List<Project>> _projectsFuture;
  final ProjectsFilterState _filterState = ProjectsFilterState();

  List<Project> _allProjects = [];

  @override
  void initState() {
    super.initState();
    _projectsFuture = ProjectLoader.load();
  }

  List<Project> get _filteredProjects {
    return _allProjects.where(_filterState.matches).toList();
  }

  void _openFilterModal() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.lg,
          ),
          child: ProjectsFilterModal(
            allProjects: _allProjects,
            onApply: () => setState(() {}),
            onReload: () {
              // reload singleton state before modal builds
              ProjectsFilterState().load(); // optional if persistence needed
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return FutureBuilder<List<Project>>(
      future: _projectsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        _allProjects = snapshot.data!;

        final filtered = _filteredProjects;

        final filter = _filterState;

        final hasFilters =
            filter.selectedTech.isNotEmpty ||
            filter.selectedProjectTypes.isNotEmpty ||
            filter.selectedStatuses.isNotEmpty ||
            filter.selectedCategories.isNotEmpty ||
            filter.selectedRoles.isNotEmpty;

        return Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                localizations.pagesProjects,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              SizedBox(height: Spacing.md),

              ProjectsFilterButton(onPressed: _openFilterModal),

              SizedBox(height: Spacing.xxl),

              // PROJECT COUNT TEXT
              // 'Builder' ensures count is evaluated after 'filtered' is computed inside the FutureBuilder!
              Builder(
                builder: (context) {
                  final count = filtered.length;

                  final String countText = count == 1
                      ? localizations.oneProjectFound
                      : localizations.projectsFound(count);

                  return Text(
                    countText,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: colors.primary),
                  );
                },
              ),

              SizedBox(height: Spacing.xl),

              // SUMMARY CHIPS
              if (hasFilters)
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Padding(
                    key: ValueKey(
                      filter.selectedTech.length +
                          filter.selectedProjectTypes.length +
                          filter.selectedStatuses.length +
                          filter.selectedCategories.length +
                          filter.selectedRoles.length,
                    ),
                    padding: EdgeInsets.only(
                      top: Spacing.md,
                      bottom: Spacing.md,
                    ),
                    child: Wrap(
                      spacing: Spacing.sm,
                      runSpacing: Spacing.sm,
                      children: [
                        // TECH
                        ...filter.selectedTech.map(
                          (t) => _buildSummaryChip(
                            context,
                            label: t,
                            onRemove: () async {
                              setState(() {
                                filter.selectedTech.remove(t);
                              });
                              await filter.save();
                            },
                          ),
                        ),

                        // PROJECT TYPES
                        ...filter.selectedProjectTypes.map(
                          (t) => _buildSummaryChip(
                            context,
                            label: localizeFilterLabel(context, t),
                            onRemove: () async {
                              setState(() {
                                filter.selectedProjectTypes.remove(t);
                              });
                              await filter.save();
                            },
                          ),
                        ),

                        // STATUS
                        ...filter.selectedStatuses.map(
                          (s) => _buildSummaryChip(
                            context,
                            label: s
                                ? localizations.statusOngoing
                                : localizations.statusCompleted,
                            onRemove: () async {
                              setState(() {
                                filter.selectedStatuses.remove(s);
                              });
                              await filter.save();
                            },
                          ),
                        ),

                        // CATEGORIES
                        ...filter.selectedCategories.map(
                          (c) => _buildSummaryChip(
                            context,
                            label: localizeFilterLabel(context, c),
                            onRemove: () async {
                              setState(() {
                                filter.selectedCategories.remove(c);
                              });
                              await filter.save();
                            },
                          ),
                        ),

                        // ROLES
                        ...filter.selectedRoles.map(
                          (r) => _buildSummaryChip(
                            context,
                            label: localizeFilterLabel(context, r),
                            onRemove: () async {
                              setState(() {
                                filter.selectedRoles.remove(r);
                              });
                              await filter.save();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // CARD GRID
              if (filtered.isEmpty)
                Text(
                  localizations.errorNoResults,
                  style: textTheme.bodySmall?.copyWith(color: colors.error),
                )
              else
                ResponsiveGrid(
                  children: filtered.map((project) {
                    return ProjectCard(
                      project: project,
                      onTap: () =>
                          context.router.pushNamed('/projects/${project.slug}'),
                    );
                  }).toList(),
                ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildSummaryChip(
  BuildContext context, {
  required String label,
  required Future<void> Function() onRemove,
}) {
  final colors = Theme.of(context).colorScheme;
  final chipColor = colors.onSurface;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.sm),
    decoration: BoxDecoration(
      color: colors.primary.withOpacity(0.15),
      borderRadius: BorderRadius.circular(999),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: TextStyle(color: chipColor)),
        SizedBox(width: Spacing.xs),
        InkWell(
          onTap: () async {
            await onRemove();
          },
          borderRadius: BorderRadius.circular(999),
          child: Icon(Icons.close, size: 16, color: chipColor),
        ),
      ],
    ),
  );
}
