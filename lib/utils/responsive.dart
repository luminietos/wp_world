import 'package:flutter_screenutil/flutter_screenutil.dart';

// Utility class for responsive design (according to Material Design breakpoints)
class Responsive {
  static double width() => ScreenUtil().screenWidth;

  static bool get isMobile => width() < 600;

  static bool get isTablet => width() >= 600 && width() < 840;

  static bool get isDesktop => width() >= 840;

  // Optional: Material 3 large desktop breakpoint
  static bool get isLargeDesktop => width() >= 1200;
}
