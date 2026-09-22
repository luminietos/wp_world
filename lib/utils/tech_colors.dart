// TECH STACK COLOR RESOLVER (for project tech stack colors)

import 'package:flutter/material.dart';
import 'package:wp_world/theme/app_colors.dart'; // where the colors are defined

Color techColor(BuildContext context, String name) {
  final brightness = Theme.of(context).brightness;
  final key = name.toLowerCase();

  final isDark = brightness == Brightness.dark;

  switch (key) {
    case 'flutter':
      return isDark ? AppColors.techFlutterDark : AppColors.techFlutterLight;
    case 'dart':
      return isDark ? AppColors.techDartDark : AppColors.techDartLight;
    case 'lottie':
      return isDark ? AppColors.techLottieDark : AppColors.techLottieLight;
    case 'figma':
      return isDark ? AppColors.techFigmaDark : AppColors.techFigmaLight;
    case 'github':
    case 'github pages':
      return isDark ? AppColors.techGitHubDark : AppColors.techGitHubLight;
    case 'aws':
      return isDark ? AppColors.techAWSDark : AppColors.techAWSLight;
    default:
      return Theme.of(context).colorScheme.secondary;
  }
}
