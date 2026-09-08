// ACCESSIBLE FOCUS & HOVER STATES

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppInteractions {
  static final focusBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.focusRing, width: 2),
  );

  static final hoverOverlay = Colors.black.withValues(alpha: 0.04);
}
