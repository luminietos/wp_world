import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/project_loader.dart';
import 'package:wp_world/helpers/localization_helpers.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/models/project.dart';
import 'package:wp_world/models/project_section.dart';
import 'package:wp_world/utils/layout.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/widgets/section.dart';

@RoutePage()
class CaseStudyPage extends StatefulWidget {
  final String slug;

  const CaseStudyPage({@PathParam('slug') required this.slug});

  @override
  State<CaseStudyPage> createState() => _CaseStudyPageState();
}

class _CaseStudyPageState extends State<CaseStudyPage> {
  late final Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = ProjectLoader.load();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return FutureBuilder<List<Project>>(
      future: _projectsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Section(
            child: Text(
              'Unable to load project: ${snapshot.error}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        final projects = snapshot.data ?? const <Project>[];
        final project = projects.firstWhere(
          (p) => p.slug == widget.slug,
          orElse: () => throw Exception('Project not found'),
        );

        return Section(
          child: ConstrainedBox(
            constraints: Layout.maxContentWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroHeader(project: project),
                SizedBox(height: Spacing.xl),
                _MetaRow(project: project),
                SizedBox(height: Spacing.xxl),

                _CaseStudyBlock(
                  title: localizations.projectResult,
                  body: project.result(context),
                ),
                SizedBox(height: Spacing.xxl),

                _CaseStudyBlock(
                  title: localizations.projectPurpose,
                  body: project.purpose(context),
                ),
                SizedBox(height: Spacing.xxl),

                _CaseStudyBlock(
                  title: localizations.projectActionsProcess,
                  body: project.actions(context),
                ),
                SizedBox(height: Spacing.xxl),

                if (project.sections != null && project.sections!.isNotEmpty)
                  ...project.sections!.map(
                    (section) => Padding(
                      padding: EdgeInsets.only(bottom: Spacing.xxl),
                      child: _CaseStudySectionBlock(section: section),
                    ),
                  ),

                if (project.imagePaths.isNotEmpty) ...[
                  SizedBox(height: Spacing.xxl),
                  _ImageGallery(project: project),
                ],

                SizedBox(height: Spacing.xxl),

                _CaseStudyBlock(
                  title: localizations.accessibilityNotes,
                  body: project.accessibilityNotes(context),
                ),
                SizedBox(height: Spacing.xxl),

                _CaseStudyBlock(
                  title: localizations.collaborationLabel,
                  body: project.collaboration(context),
                ),
                SizedBox(height: Spacing.xl),

                if (project.projectLink != null &&
                    project.projectLink!.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      // TODO: open link with url_launcher
                    },
                    child: Text(localizations.projectView),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
// HERO

class _HeroHeader extends StatelessWidget {
  final Project project;

  const _HeroHeader({required this.project});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.name(context),
          style: textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colors.onSurface,
          ),
        ),
        SizedBox(height: Spacing.sm),
        Text(
          '${project.clientOrCompany} • ${project.projectType}',
          style: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
        ),
        SizedBox(height: Spacing.md),
        Text(
          project.summary(context),
          style: textTheme.bodyLarge?.copyWith(color: colors.onSurface),
        ),
        SizedBox(height: Spacing.lg),
        if (project.heroImagePath != null && project.heroImagePath!.isNotEmpty)
          Semantics(
            label: localizations.projectImageLabel(project.name(context)),
            image: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(project.heroImagePath!, fit: BoxFit.cover),
            ),
          )
        else
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
      ],
    );
  }
}

// META ROW

class _MetaRow extends StatelessWidget {
  final Project project;

  const _MetaRow({required this.project});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    final isMobile = Responsive.isMobile;

    final statusLabel = project.isOngoing
        ? localizations.statusOngoing
        : localizations.statusCompleted;

    final items = <_MetaItem>[
      _MetaItem(
        label: localizations.projectClient,
        value: project.clientOrCompany,
      ),
      if (project.duration.isNotEmpty)
        _MetaItem(label: localizations.durationLabel, value: project.duration),
      _MetaItem(label: localizations.typeLabel, value: project.projectType),
      _MetaItem(label: localizations.statusLabel, value: statusLabel),
    ];

    final children = items
        .map(
          (item) => Padding(
            padding: EdgeInsets.only(right: Spacing.lg, bottom: Spacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Spacing.xs),
                Text(
                  item.value,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return Semantics(
      container: true,
      label: localizations.projectMetadata,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
    );
  }
}

class _MetaItem {
  final String label;
  final String value;

  _MetaItem({required this.label, required this.value});
}

// CASE STUDY BLOCK

class _CaseStudyBlock extends StatelessWidget {
  final String title;
  final String body;

  const _CaseStudyBlock({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.headlineSmall),
        SizedBox(height: Spacing.md),
        Text(body, style: textTheme.bodyMedium),
      ],
    );
  }
}

// STRUCTURED SECTION BLOCK

class _CaseStudySectionBlock extends StatelessWidget {
  final ProjectSection section;

  const _CaseStudySectionBlock({required this.section});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localized(context, section.headingKey),
          style: textTheme.headlineSmall,
        ),
        SizedBox(height: Spacing.md),
        Text(localized(context, section.bodyKey), style: textTheme.bodyMedium),
      ],
    );
  }
}

// IMAGE GALLERY

class _ImageGallery extends StatelessWidget {
  final Project project;

  const _ImageGallery({required this.project});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;

    int columns = 1;
    if (isTablet) columns = 2;
    if (Responsive.isDesktop) columns = 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localizations.imagesLabel, style: textTheme.headlineSmall),
        SizedBox(height: Spacing.md),
        LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth =
                (constraints.maxWidth - (Spacing.md * (columns - 1))) / columns;

            return Wrap(
              spacing: Spacing.md,
              runSpacing: Spacing.md,
              children: project.imagePaths.map((img) {
                return SizedBox(
                  width: isMobile ? constraints.maxWidth : itemWidth,
                  child: Semantics(
                    container: true,
                    label: img.caption(context),
                    image: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(img.path, fit: BoxFit.cover),
                        ),
                        SizedBox(height: Spacing.sm),
                        Text(
                          img.caption(context),
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
