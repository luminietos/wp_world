// ACCESSIBLE FOCUS & HOVER STATES

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppInteractions {
  static const double borderWidth = 2;
  static const double hoverBorderWidth = 2.5;
  static const double focusBorderWidth = 3;

  static final focusBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.focusRing, width: focusBorderWidth),
  );

  static final hoverOverlay = Colors.black.withValues(alpha: 0.04);
}
