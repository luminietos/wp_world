import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/project_loader.dart';
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

        return Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
