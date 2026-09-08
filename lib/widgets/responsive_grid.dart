// RESPONSIVE GRID SYSTEM 

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import '../utils/responsive.dart';
import '../utils/spacing.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    int columns = 1;

    if (Responsive.isTablet) columns = 2;
    if (Responsive.isDesktop) columns = 3;

    return Semantics(
      container: true,
      label: localizations.responsiveGridLayout,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: columns,
            crossAxisSpacing: Spacing.md,
            mainAxisSpacing: Spacing.md,
            children: children,
          );
        },
      ),
    );
  }
}
