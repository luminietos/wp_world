// FILTERS ARE GROUPED BY ATTRIBUTE & USERS CAN SELECT MULTIPLE OPTIONS PER GROUP

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_helpers.dart';
import 'package:wp_world/models/project.dart';
import 'package:wp_world/state/projects_filter_state.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/utils/tech_colors.dart';

class ProjectsFilterModal extends StatefulWidget {
  final List<Project> allProjects;
  final VoidCallback onApply;

  const ProjectsFilterModal({
    super.key,
    required this.allProjects,
    required this.onApply,
  });

  @override
  State<ProjectsFilterModal> createState() => _ProjectsFilterModalState();
}

class _ProjectsFilterModalState extends State<ProjectsFilterModal> {
  late final ProjectsFilterState _state;

  // Temporary selections (WCAG 3.2.2 — no auto apply)
  late Set<String> tech;
  late Set<String> types;
  late Set<bool> statuses;
  late Set<String> categories;
  late Set<String> roles;

  @override
  void initState() {
    super.initState();
    _state = ProjectsFilterState();

    tech = Set.from(_state.selectedTech);
    types = Set.from(_state.selectedProjectTypes);
    statuses = Set.from(_state.selectedStatuses);
    categories = Set.from(_state.selectedCategories);
    roles = Set.from(_state.selectedRoles);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Collect unique options
    final techOptions = {
      for (final p in widget.allProjects) ...p.techStack,
    }.toList()..sort();

    final typeOptions = {
      for (final p in widget.allProjects) p.projectType,
    }.toList()..sort();

    final statusOptions = {
      for (final p in widget.allProjects) p.isOngoing,
    }.toList();

    final categoryOptions = {
      for (final p in widget.allProjects) ...p.categories,
    }.toList()..sort();

    final roleOptions = {
      for (final p in widget.allProjects) ...p.rolesStack,
    }.toList()..sort();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Spacing.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tech.clear();
                        types.clear();
                        statuses.clear();
                        categories.clear();
                        roles.clear();
                      });
                    },
                    child: Text(
                      localizations.filterReset,
                      style: textTheme.bodySmall,
                    ),
                  ),
                  Text(localizations.filter, style: textTheme.titleMedium),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),

              SizedBox(height: Spacing.lg),

              _buildStringGroup(
                context,
                title: localizations.techStack,
                options: techOptions,
                selected: tech,
                isTechGroup: true,
                semanticsLabel: localizations.filterGroupTechStack,
              ),

              _buildStringGroup(
                context,
                title: localizations.typeLabel,
                options: typeOptions,
                selected: types,
                semanticsLabel: localizations.filterGroupProjectType,
              ),

              _buildStatusGroup(
                context,
                title: localizations.statusLabel,
                options: statusOptions,
                selected: statuses,
                semanticsLabel: localizations.filterGroupStatus,
              ),

              _buildStringGroup(
                context,
                title: localizations.categoriesLabel,
                options: categoryOptions,
                selected: categories,
                semanticsLabel: localizations.filterGroupCategories,
              ),

              _buildStringGroup(
                context,
                title: localizations.projectRoles,
                options: roleOptions,
                selected: roles,
                semanticsLabel: localizations.filterGroupRoles,
              ),

              SizedBox(height: Spacing.xl),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _state.selectedTech
                      ..clear()
                      ..addAll(tech);

                    _state.selectedProjectTypes
                      ..clear()
                      ..addAll(types);

                    _state.selectedStatuses
                      ..clear()
                      ..addAll(statuses);

                    _state.selectedCategories
                      ..clear()
                      ..addAll(categories);

                    _state.selectedRoles
                      ..clear()
                      ..addAll(roles);

                    widget.onApply();
                    Navigator.of(context).pop();
                  },
                  child: Text(localizations.filterApply),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _countStatus(bool value) {
    return widget.allProjects.where((p) => p.isOngoing == value).length;
  }

  int _countTag(String value) {
    return widget.allProjects.where((p) {
      return p.techStack.contains(value) ||
          p.rolesStack.contains(value) ||
          p.categories.contains(value) ||
          p.projectType == value;
    }).length;
  }

  Widget _buildStatusGroup(
    BuildContext context, {
    required String title,
    required List<bool> options,
    required Set<bool> selected,
    String? semanticsLabel,
  }) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    final int selectedCount = selected.length;
    final int totalCount = options.length;
    final String hint = localizations.filterGroupHint(
      selectedCount,
      totalCount,
    );

    return Semantics(
      container: true,
      label: semanticsLabel,
      hint: hint, // Screen reader hint for how many chips selected/left!
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Spacing.sm),
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: options.map((option) {
              final bool isSelected = selected.contains(option);
              final int count = _countStatus(option);

              final String displayLabel = option
                  ? "${localizations.statusOngoing} ($count)"
                  : "${localizations.statusCompleted} ($count)";

              return FilterChip(
                label: Text(
                  displayLabel,
                  style: textTheme.bodySmall?.copyWith(
                    color: isSelected ? colors.onPrimary : colors.onSurface,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
                side: isSelected
                    ? BorderSide.none
                    : BorderSide(color: colors.outlineVariant, width: 0.5),
                selected: isSelected,
                showCheckmark: true,
                checkmarkColor: colors.onPrimary,
                selectedColor: colors.primary,
                backgroundColor: colors.surfaceVariant,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.sm,
                  vertical: Spacing.xs,
                ),
                shape: const StadiumBorder(),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      selected.add(option);
                    } else {
                      selected.remove(option);
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: Spacing.lg),
        ],
      ),
    );
  }

  Widget _buildStringGroup(
    BuildContext context, {
    required String title,
    required List<String> options,
    required Set<String> selected,
    String? semanticsLabel,
    bool isTechGroup = false,
  }) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    final int selectedCount = selected.length;
    final int totalCount = options.length;
    final String hint = localizations.filterGroupHint(
      selectedCount,
      totalCount,
    );

    return Semantics(
      container: true,
      label: semanticsLabel,
      hint: hint,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Spacing.sm),
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: options.map((option) {
              final bool isSelected = selected.contains(option);
              final int count = _countTag(option);

              final String displayLabel = isTechGroup
                  ? "$option ($count)"
                  : "${localizeFilterLabel(context, option)} ($count)";

              final Color selectedColor = isTechGroup
                  ? techColor(context, option)
                  : colors.primary;

              final Color labelColor = isSelected
                  ? (isTechGroup ? colors.surface : colors.onPrimary)
                  : colors.onSurface;

              return FilterChip(
                label: Text(
                  displayLabel,
                  style: textTheme.bodySmall?.copyWith(
                    color: labelColor,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
                side: isSelected
                    ? BorderSide.none
                    : BorderSide(color: colors.outlineVariant, width: 0.5),
                selected: isSelected,
                showCheckmark: true,
                checkmarkColor: isTechGroup ? colors.surface : colors.onPrimary,
                selectedColor: selectedColor,
                backgroundColor: colors.surfaceVariant,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.sm,
                  vertical: Spacing.xs,
                ),
                shape: const StadiumBorder(),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      selected.add(option);
                    } else {
                      selected.remove(option);
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: Spacing.lg),
        ],
      ),
    );
  }
}
