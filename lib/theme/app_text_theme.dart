// HANDLES THE DESIGN SYSTEM TYPOGRAPHY SCALING AND STYLING
// This file does not have an opinion on the theme mode or persistence, it just defines the text styles.

import 'package:flutter/material.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/text_sizes.dart'; // uses the constants for font sizes

class AppTextTheme {
  static TextTheme get textTheme {
    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;
    final isDesktop = Responsive.isDesktop;

    double h1 = isDesktop
        ? TextSizes.h1Desktop
        : isTablet
        ? TextSizes.h1Tablet
        : TextSizes.h1Mobile;

    double h2 = isDesktop
        ? TextSizes.h2Desktop
        : isTablet
        ? TextSizes.h2Tablet
        : TextSizes.h2Mobile;

    double h3 = isDesktop
        ? TextSizes.h3Desktop
        : isTablet
        ? TextSizes.h3Tablet
        : TextSizes.h3Mobile;

    double h4 = isDesktop
        ? TextSizes.h4Desktop
        : isTablet
        ? TextSizes.h4Tablet
        : TextSizes.h4Mobile;

    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: h1,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      headlineMedium: TextStyle(
        fontSize: h2,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      headlineSmall: TextStyle(
        fontSize: h3,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleMedium: TextStyle(
        fontSize: h4,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),

      bodyLarge: TextStyle(fontSize: TextSizes.bodyLargeMobile, height: 1.5),
      bodyMedium: TextStyle(fontSize: TextSizes.bodyMobile, height: 1.5),
      bodySmall: TextStyle(fontSize: TextSizes.bodySmallMobile, height: 1.5),

      labelSmall: TextStyle(
        fontSize: TextSizes.captionMobile,
        height: 1.4,
        letterSpacing: 0.2,
      ),
    );
  }
}
