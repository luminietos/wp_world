import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/loaders/home_content_loader.dart';
import 'package:wp_world/models/home/home_content.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/utils/layout.dart';
import 'package:wp_world/utils/responsive.dart';

import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/widgets/components/section_header.dart';
import 'package:wp_world/widgets/components/section_content.dart';
import 'package:wp_world/widgets//skill_chip.dart';
import 'package:wp_world/widgets/project_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<HomeContent> _loadHomeContent() {
    return HomeContentLoader.load();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: FutureBuilder<HomeContent>(
        future: _loadHomeContent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
              child: Text(
                'Failed to load home content.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
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
                  // HERO SECTION
                  Section(
                    title: localizations.title,
                    description: home.hero.descriptionBlock != null
                        ? SectionContent(blocks: home.hero.descriptionBlock!)
                        : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (home.hero.headingBlock != null)
                          SectionHeader(headingBlock: home.hero.headingBlock!),
                        if (home.hero.contentBlocks.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: Spacing.sm),
                            child: SectionContent(
                              blocks: home.hero.contentBlocks,
                            ),
                          ),
                      ],
                    ),
                  ),

                  // FEATURED SKILLS
                  if (home.featuredSkills.skills.isNotEmpty)
                    Section(
                      title: localizations.skillsTitle,
                      child: Wrap(
                        spacing: Spacing.sm,
                        runSpacing: Spacing.sm,
                        children: home.featuredSkills.skills
                            .map((skill) => SkillChip(skill: skill))
                            .toList(),
                      ),
                    ),

                  // FEATURED PROJECTS
                  if (home.featuredProjects.projects.isNotEmpty)
                    Section(
                      title: localizations.projectsFeaturedTitle,
                      child: _buildProjectsGrid(context, home),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context, HomeContent home) {
    final isDesktop = Responsive.isDesktop;
    final isTablet = Responsive.isTablet;

    final crossAxisCount = isDesktop
        ? 3
        : isTablet
        ? 2
        : 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / crossAxisCount;

        return Wrap(
          spacing: Spacing.md,
          runSpacing: Spacing.md,
          children: home.featuredProjects.projects.map((project) {
            return SizedBox(
              width: itemWidth - Spacing.md,
              child: ProjectCard(
                project: project,
                onTap: () {
                  // Navigate to case study page for this project
                  // context.router.push(CaseStudyRoute(projectId: project.id));
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
