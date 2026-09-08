// DEFINES LAYOUT CONSTANTS (max widths, gutters, etc.) & PROVIDES LAYOUT-RELATED UTILITIES

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'responsive.dart';

class Layout {
  // MAX WIDTHS (Material-inspired)
  static double get maxWidthMobile => 600.w;
  static double get maxWidthTablet => 840.w;
  static double get maxWidthDesktop => 1200.w;

  // GUTTERS (responsive page padding)
  static double get gutterMobile => 16.w;
  static double get gutterTablet => 24.w;
  static double get gutterDesktop => 32.w;

  // Returns the correct max width for the current breakpoint
  static double maxWidth() {
    if (Responsive.isMobile) return maxWidthMobile;
    if (Responsive.isTablet) return maxWidthTablet;
    return maxWidthDesktop;
  }

  // Returns the correct horizontal padding for the current breakpoint
  static double horizontalPadding() {
    if (Responsive.isMobile) return gutterMobile;
    if (Responsive.isTablet) return gutterTablet;
    return gutterDesktop;
  }
}
