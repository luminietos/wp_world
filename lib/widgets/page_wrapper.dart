// This is now the ONE vertical scroll container for all pages!!

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
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

    final maxWidth = isDesktop ? 1200.0 : 680.0;

    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: localizations.pageContentWrapper,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
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
    );
  }
}
