// THE FOOTER WIDGET

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/spacing.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;
    final isDesktop = Responsive.isDesktop;

    final footerPadding = isMobile
        ? Spacing.xxl
        : isTablet
        ? Spacing.xl
        : isDesktop
        ? Spacing.lg
        : Spacing.md;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: Spacing.xl), // space above the footer
        // DECORATIVE DIVIDER
        ExcludeSemantics(
          // marks as decorative for assistive tech
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: colors.primary,
          ),
        ),

        // THE FOOTER ITSELF
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: footerPadding,
          ),
          child: Text(
            localizations.wpFooter,
            style: textTheme.bodyLarge!.copyWith(
              color: colors.primary.withValues(alpha: 0.50), // lowered opacity
            ),
          ),
        ),
      ],
    );
  }
}
