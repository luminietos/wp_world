// CUSTOM PAGE TRANSITION/S FOR AUTOROUTE

import 'package:flutter/material.dart';

/// A custom transition that NEVER overlays the old page.
/// The old page is removed immediately.
/// The new page fades in cleanly.
/// No zoom, no slide, no ghosting.
Widget noOverlayFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}
