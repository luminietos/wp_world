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

    // Responsive spacing rules
    final double titleSpacing = Responsive.isMobile ? Spacing.md : Spacing.lg;
    final double descriptionSpacing = Responsive.isMobile
        ? Spacing.sm
        : Spacing.md;

    return Semantics(
      container: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Spacing.md), // space below header and above title
          // TITLE (optional)
          if (title != null)
            Padding(
              padding: EdgeInsets.only(bottom: titleSpacing),
              child: Text(title!, style: textTheme.headlineMedium),
            ),

          // DESCRIPTION (optional)
          if (description != null)
            Padding(
              padding: EdgeInsets.only(bottom: descriptionSpacing),
              child: DefaultTextStyle(
                style: textTheme.bodyLarge!,
                child: description!,
              ),
            ),

          SizedBox(height: Spacing.md),

          // MAIN CONTENT
          child,

          // TRAILING (optional)
          if (trailing != null)
            Padding(
              padding: EdgeInsets.only(top: Spacing.lg),
              child: trailing!,
            ),

          // SECTION SPACING (vertical rhythm)
          SizedBox(height: Responsive.isMobile ? Spacing.xl : Spacing.xxl),
        ],
      ),
    );
  }
}
