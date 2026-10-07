// TIMELINE DOTS' (markers) ICONS FOR THE TIMELINE WIDGET IN ABOUT PAGE

import 'package:flutter/material.dart';
import 'package:wp_world/models/timeline_event.dart';
import 'package:wp_world/utils/icon_sizes.dart';

class TimelineMarkerIcon extends StatelessWidget {
  final TimelineEvent event;
  final Color color;

  const TimelineMarkerIcon({
    super.key,
    required this.event,
    required this.color,
  });

  IconData _resolveIcon() {
    if (event.isStudy) return Icons.school; // 🎓 Study
    if (event.labelKey.contains('Internship')) {
      return Icons.build; // 🛠 Internship
    }
    return Icons.work; // 💼 Work
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = IconSizes.medium;

    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 1.5),
      ),
      child: Icon(_resolveIcon(), size: iconSize * 0.6, color: color),
    );
  }
}
