// This is now the ONE vertical scroll container for all pages!!

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/widgets/responsive_grid.dart';
// import '../utils/layout.dart';
import '../utils/responsive.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;
    final isDesktop = Responsive.isDesktop;

    final horizontalPadding = isMobile
        ? 16.0
        : isTablet
        ? 24.0
        : 48.0;

    final verticalPadding = isMobile ? 24.0 : 32.0;

    // dynamic maxWidth based on page type
    double maxWidth;

    if (child is ResponsiveGrid) {
      // ProjectsPage grid
      maxWidth = 1200;
    } else {
      // Text-heavy pages
      maxWidth = isDesktop ? 840 : 680;
    }

    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: localizations.pageContentWrapper,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        // global scroll container
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
