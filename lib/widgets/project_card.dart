import 'package:flutter/material.dart';
import 'package:wp_world/models/project.dart';
import 'package:wp_world/widgets/components/app_card.dart'; // the base
import 'package:wp_world/utils/spacing.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // THUMBNAIL
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              project.logoPath,
              fit: BoxFit.contain,
              height: 64,
            ),
          ),

          SizedBox(height: Spacing.lg),

          // TITLE
          Text(
            project.name(context),
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.onSurface,
            ),
          ),

          SizedBox(height: Spacing.sm),

          // SUMMARY
          Text(
            project.summary(context),
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),

          SizedBox(height: Spacing.md),

          // CATEGORIES/TAGS
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: project.categories.map((cat) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.md,
                  vertical: Spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  cat.toUpperCase(),
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: Spacing.md),

          // 'ONGOING' BADGE
          if (project.isOngoing)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.md,
                vertical: Spacing.xs,
              ),
              decoration: BoxDecoration(
                color: colors.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'ONGOING',
                style: textTheme.labelSmall?.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
