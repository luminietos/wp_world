// GIVES PAGES VERTICAL RHYTHM AND SEMANTIC CONTAINER/STRUCTURE - a semantic, responsive, design-system Section wrapper
// It provides vertical rhythm, consistent spacing, semantic grouping, responsive spacing & typography hierarchy

import 'package:flutter/material.dart';
import 'package:wp_world/utils/responsive.dart';
import '../utils/spacing.dart';

class Section extends StatelessWidget {
  final String? title;
  final Widget child;
  final Widget? description;
  final Widget? trailing;

  const Section({
    super.key,
    this.title,
    required this.child,
    this.description,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;

    // ORIGINAL DESKTOP VALUES KEPT
    double desktopTopSpacing = Spacing.md;
    double desktopTitleSpacing = Spacing.lg;
    double desktopDescriptionSpacing = Spacing.lg;
    double desktopSectionSpacing = Spacing.xxl;

    // MOBILE/TABLET: ONLY THESE ARE INCREASED
    final double topSpacing = isMobile || isTablet
        ? Spacing
              .lg // was Spacing.md
        : desktopTopSpacing;

    final double titleSpacing = isMobile || isTablet
        ? Spacing
              .xl // was Spacing.md / Spacing.lg
        : desktopTitleSpacing;

    final double descriptionSpacing = isMobile || isTablet
        ? Spacing
              .xl // was Spacing.md / Spacing.lg
        : desktopDescriptionSpacing;

    final double sectionSpacing = isMobile || isTablet
        ? Spacing
              .xxxl // was Spacing.xl
        : desktopSectionSpacing;

    return Semantics(
      container: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: topSpacing),

          if (title != null)
            Padding(
              padding: EdgeInsets.only(bottom: titleSpacing),
              child: Text(title!, style: textTheme.headlineMedium),
            ),

          if (description != null)
            Padding(
              padding: EdgeInsets.only(bottom: descriptionSpacing),
              child: DefaultTextStyle(
                style: textTheme.bodyLarge!,
                child: description!,
              ),
            ),

          child,

          if (trailing != null)
            Padding(
              padding: EdgeInsets.only(top: Spacing.lg),
              child: trailing!,
            ),

          SizedBox(height: sectionSpacing),
        ],
      ),
    );
  }
}
