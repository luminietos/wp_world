// MY CUSTOM COLOR PALETTE TOKENS

import 'package:flutter/material.dart';

class AppColors {
  // 'BRAND' ACCENTS
  static const Color accentGreen = Color(0xFF4A6F5A); // woodsy, cool-toned
  static const Color accentLavender = Color(0xFFB8A8C9); // muted lavender

  // NEUTRALS (LIGHT MODE)
  static const Color lightBackground = Color(0xFFF7F7F7);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1A1A1A);
  static const Color lightSubtleText = Color(0xFF4A4A4A);

  // NEUTRALS (DARK MODE)
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFEAEAEA);
  static const Color darkSubtleText = Color(0xFFBEBEBE);

  // FEEDBACK
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFEF5350);

  // FOCUS STATES (ACCESSIBLE)
  static const Color focusRing = Color(0xFF0066FF); // WCAG AA compliant
}
