// ADAPTABLE BTN FOR THE PROJECT FILTER

import 'package:flutter/material.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/spacing.dart'; // unused??
import 'package:wp_world/l10n/app_localizations.dart';

class ProjectsFilterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProjectsFilterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile;
    final localizations = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.centerLeft,
      // Determines btn UI based on screen size
      child: isMobile
          ? IconButton(
              icon: const Icon(Icons.filter_list_rounded),
              tooltip: localizations.filterProjects,
              onPressed: onPressed,
            )
          : TextButton.icon(
              icon: const Icon(Icons.filter_list_rounded),
              label: Text(localizations.filterProjects),
              onPressed: onPressed,
            ),
    );
  }
}
