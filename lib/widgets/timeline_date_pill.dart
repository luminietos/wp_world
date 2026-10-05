// PILL BASE FOR THE TIMELINE WIDGET IN ABOUT PAGE

import 'package:flutter/material.dart';
import 'package:wp_world/utils/spacing.dart';

class TimelineDatePill extends StatelessWidget {
  final String text;
  final Color color;
  final Color? backgroundColor;
  final Color? textColor;
  final bool withBorder;

  const TimelineDatePill({
    super.key,
    required this.text,
    required this.color,
    this.backgroundColor,
    this.textColor,
    this.withBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final bg = backgroundColor ?? colors.surface;
    final fg = textColor ?? color;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(Spacing.xl),
        border: withBorder ? Border.all(color: color, width: 1.5) : null,
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: fg, fontWeight: FontWeight.w600),
      ),
    );
  }
}
