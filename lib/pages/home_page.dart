// HOME PAGE — CLEAN, RESPONSIVE, ACCESSIBLE, MODEL-ALIGNED

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/l10n/app_localizations.dart';

import 'package:wp_world/loaders/home_content_loader.dart';
import 'package:wp_world/loaders/project_loader.dart';
import 'package:wp_world/models/home/home_content.dart';
import 'package:wp_world/models/global/localized_text_block.dart';
import 'package:wp_world/models/projects/project.dart';

import 'package:wp_world/models/skills/skill.dart';
import 'package:wp_world/utils/layout.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/utils/responsive.dart';

import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/widgets/components/section_header.dart';
import 'package:wp_world/widgets/components/section_content.dart';
import 'package:wp_world/widgets/project_card.dart';
import 'package:wp_world/widgets/skills/skill_chip.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<HomeContent> _load() => HomeContentLoader.load();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FutureBuilder<HomeContent>(
      future: _load(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final home = snapshot.data!;
        final localizations = AppLocalizations.of(context)!;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Layout.horizontalPadding(),
            vertical: Spacing.lg,
          ),
          child: ConstrainedBox(
            constraints: Layout.maxContentWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                // ────────────────────────────────────────────────
                // HERO SECTION
                // ────────────────────────────────────────────────
                //
                Section(
                  title: localizations.title,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildHeroBlocks(context, home.hero.blocks),
                  ),
                ),

                //
                // ────────────────────────────────────────────────
                // FEATURED SKILLS
                // ────────────────────────────────────────────────
                //
                // if (home.featuredSkills.skillIds.isNotEmpty)
                //   Section(
                //     title: localizations.skillsTitle,
                //     child: Wrap(
                //       spacing: Spacing.sm,
                //       runSpacing: Spacing.sm,
                //       children: home.featuredSkills.skillIds.map((id) {
                //         final label = localizations.getString(id);
                //         return SkillChip(
                //           skill: Skill(id: id, labelKey: id),
                //         );
                //       }).toList(),
                //     ),
                //   ),

                //
                // ────────────────────────────────────────────────
                // FEATURED PROJECTS
                // ────────────────────────────────────────────────
                //
                if (home.featuredProjects.projectIds.isNotEmpty)
                  Section(
                    title: localizations.projectsFeaturedTitle,
                    child: _buildProjectsGrid(
                      context,
                      home.featuredProjects.projectIds,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  //
  // ────────────────────────────────────────────────
  // HERO BLOCK RENDERING
  // ────────────────────────────────────────────────
  //
  List<Widget> _buildHeroBlocks(
    BuildContext context,
    List<LocalizedTextBlock> blocks,
  ) {
    final widgets = <Widget>[];

    for (final block in blocks) {
      if (block.type == TextBlockType.heading) {
        widgets.add(SectionHeader(headingBlock: block));
        widgets.add(SizedBox(height: Spacing.sm));
      } else {
        widgets.add(SectionContent(blocks: [block]));
      }
    }

    return widgets;
  }

  //
  // ────────────────────────────────────────────────
  // FEATURED PROJECTS GRID
  // ────────────────────────────────────────────────
  //
  Widget _buildProjectsGrid(BuildContext context, List<String> projectIds) {
    final isDesktop = Responsive.isDesktop;
    final isTablet = Responsive.isTablet;

    final columns = isDesktop
        ? 3
        : isTablet
        ? 2
        : 1;

    return FutureBuilder<List<Project>>(
      future: ProjectLoader.load(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final allProjects = snapshot.data!;
        final featured = allProjects
            .where((p) => projectIds.contains(p.id))
            .toList();

        return LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / columns;

            return Wrap(
              spacing: Spacing.md,
              runSpacing: Spacing.md,
              children: featured.map((project) {
                return SizedBox(
                  width: itemWidth - Spacing.md,
                  child: ProjectCard(
                    project: project,
                    onTap: () {
                      // context.router.push(CaseStudyRoute(projectId: project.id));
                    },
                  ),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
