// PROJECT CARD

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/models/project.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/utils/tech_colors.dart';
import 'package:wp_world/widgets/components/app_card.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final statusLabel = project.isOngoing ? 'Ongoing' : 'Completed';

    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // THUMBNAIL
          if (project.thumbnailPath != null &&
              project.thumbnailPath!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                project.thumbnailPath!,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            )
          else
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

          SizedBox(height: Spacing.lg),

          // TITLE
          Text(project.name(context), style: textTheme.headlineSmall),

          SizedBox(height: Spacing.sm),

          // CLIENT + TYPE
          Text(
            '${project.clientOrCompany} • ${project.projectType}',
            style: textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),

          SizedBox(height: Spacing.sm),

          // SUMMARY
          Text(project.summary(context), style: textTheme.bodyMedium),

          SizedBox(height: Spacing.md),

          // META ROW (DURATION + STATUS)
          Row(
            children: [
              if (project.duration.isNotEmpty)
                Text(
                  project.duration,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              if (project.duration.isNotEmpty) SizedBox(width: Spacing.md),
              Text(
                statusLabel,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),

          SizedBox(height: Spacing.md),

          // TECH STACK TAGS
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: project.techStack.map((techName) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.md,
                  vertical: Spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: techColor(context, techName),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  techName,
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onPrimary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
