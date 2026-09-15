import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/project_loader.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/models/project.dart';
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

  @override
  void initState() {
    super.initState();
    _projectsFuture = ProjectLoader.load();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return FutureBuilder(
      future: _projectsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Unable to load projects: ${snapshot.error}'),
          );
        }

        final projects = snapshot.data ?? const <Project>[];

        return Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // p
              Text(
                localizations.pagesProjects,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              SizedBox(height: Spacing.xl),

              // ⭐ Responsive grid of ProjectCards
              ResponsiveGrid(
                children: projects.map((project) {
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
