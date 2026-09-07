// HANDLES THE DESIGN SYSTEM TYPOGRAPHY SCALING AND STYLING
// This file does not have an opinion on the theme mode or persistence, it just defines the text styles.

import 'package:flutter/material.dart';
import 'package:wp_world/utils/text_sizes.dart'; // uses the constants for font sizes

class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
    headlineLarge: TextStyle(fontSize: TextSizes.h1),
    headlineMedium: TextStyle(fontSize: TextSizes.h2),
    headlineSmall: TextStyle(fontSize: TextSizes.h3),
    titleMedium: TextStyle(fontSize: TextSizes.h4),

    bodyLarge: TextStyle(fontSize: TextSizes.bodyLarge),
    bodyMedium: TextStyle(fontSize: TextSizes.body),
    bodySmall: TextStyle(fontSize: TextSizes.bodySmall),

    labelSmall: TextStyle(fontSize: TextSizes.caption),
  );
}
