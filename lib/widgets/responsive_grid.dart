// RESPONSIVE GRID SYSTEM

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/spacing.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;

    int columns = 1;
    if (isTablet) columns = 2;
    if (Responsive.isDesktop) columns = 3;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            (constraints.maxWidth - (Spacing.md * (columns - 1))) / columns;

        return Wrap(
          spacing: Spacing.md,
          runSpacing: Spacing.md,
          children: children.map((child) {
            return SizedBox(width: itemWidth, child: child);
          }).toList(),
        );
      },
    );
  }
}
