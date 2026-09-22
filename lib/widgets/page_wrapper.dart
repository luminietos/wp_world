// This is now the ONE vertical scroll container for all pages!!

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import '../utils/layout.dart';
import '../utils/responsive.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isMobile = Responsive.isMobile;

    return Semantics(
      container: true,
      label: localizations.pageContentWrapper,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        // global scroll container
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Layout.horizontalPadding(),
              vertical: isMobile ? 16 : 32,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Layout.maxWidth()),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
