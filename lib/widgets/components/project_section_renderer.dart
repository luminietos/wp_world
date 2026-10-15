// RENDERS PROJECT SECTIONS WITH HEADING, BODY & OPTIONAL IMAGES

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/projects/project_section.dart';
import 'package:wp_world/models/projects/project_image.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/theme/app_text_theme.dart';

class ProjectSectionRenderer extends StatelessWidget {
  final ProjectSection section;
  final List<ProjectImage> images;

  const ProjectSectionRenderer({
    super.key,
    required this.section,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = AppTextTheme.textTheme;

    final heading = localizations.getString(section.headingKey);
    final body = localizations.getString(section.bodyKey);

    final sectionImages = images;

    return Semantics(
      container: true,
      child: Padding(
        padding: EdgeInsets.only(bottom: Spacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Spacing.sm),
              child: Text(
                body,
                style: textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            if (sectionImages.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: Spacing.md),
                child: Wrap(
                  spacing: Spacing.md,
                  runSpacing: Spacing.md,
                  children: sectionImages.map((img) {
                    return Semantics(
                      label: img.semanticLabel,
                      image: !img.isDecorative,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(img.path, fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
