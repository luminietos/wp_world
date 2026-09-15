import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/project_loader.dart';
import 'package:wp_world/models/project.dart';
import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/utils/spacing.dart';

@RoutePage()
class CaseStudyPage extends StatefulWidget {
  final String slug;

  const CaseStudyPage({super.key, @PathParam('slug') required this.slug});

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
    return FutureBuilder(
      future: _projectsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Unable to load project: ${snapshot.error}'),
          );
        }

        final projects = snapshot.data ?? const <Project>[];
        final project = projects.firstWhere(
          (p) => p.slug == widget.slug,
          orElse: () => throw Exception('Project not found'),
        );

        return Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ⭐ Title
              Text(
                project.name(context),
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              SizedBox(height: Spacing.lg),

              // ⭐ Summary
              Text(
                project.summary(context),
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: Spacing.xl),

              // ⭐ Purpose
              _CaseStudyBlock(title: 'Purpose', body: project.purpose(context)),

              SizedBox(height: Spacing.xl),

              // ⭐ Actions & Process
              _CaseStudyBlock(
                title: 'Actions & Process',
                body: project.actions(context),
              ),

              SizedBox(height: Spacing.xl),

              // ⭐ Result
              _CaseStudyBlock(title: 'Result', body: project.result(context)),

              SizedBox(height: Spacing.xl),

              // ⭐ Images
              if (project.imagePaths.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Images',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: Spacing.md),
                    ...project.imagePaths.map((img) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: Spacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(img.path),
                            ),
                            SizedBox(height: Spacing.sm),
                            Text(
                              img.caption(context), 
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),

              SizedBox(height: Spacing.xl),

              // ⭐ Accessibility Notes
              _CaseStudyBlock(
                title: 'Accessibility Notes',
                body: project.accessibilityNotes(context),
              ),

              SizedBox(height: Spacing.xl),

              // ⭐ Collaboration
              _CaseStudyBlock(
                title: 'Collaboration',
                body: project.collaboration(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

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
