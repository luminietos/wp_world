// REUSABLE, THEME-AWARE BUTTON COMPONENT
// variants: primary, secondary

import 'package:flutter/material.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/utils/icon_sizes.dart';

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.fullWidth = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovering = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Base colors per variant
    final Color baseBg;
    final Color fgColor;
    final Color borderColor;

    switch (widget.variant) {
      case AppButtonVariant.primary:
        baseBg = colors.primary;
        fgColor = colors.onPrimary;
        borderColor = Colors.transparent;
        break;
      case AppButtonVariant.secondary:
        baseBg = colors.secondary;
        fgColor = colors.onSecondary;
        borderColor = Colors.transparent;
        break;
      case AppButtonVariant.subtle:
        baseBg = Colors.transparent;
        fgColor = colors.onSurface;
        borderColor = colors.outline;
        break;
    }

    // Apply hover overlay for non-transparent variants
    final Color bgColor = _hovering && widget.variant != AppButtonVariant.subtle
        ? baseBg.withValues(alpha: 0.9)
        : baseBg;

    return Semantics(
      button: true,
      label: widget.label,
      child: Focus(
        onFocusChange: (hasFocus) => setState(() => _focused = hasFocus),
        child: MouseRegion(
          cursor: widget.onPressed != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              width: widget.fullWidth ? double.infinity : null,
              padding: EdgeInsets.symmetric(
                vertical: Spacing.md,
                horizontal: Spacing.lg,
              ),
              decoration: BoxDecoration(
                color: widget.variant == AppButtonVariant.subtle
                    ? (_hovering ? AppInteractions.hoverOverlay : baseBg)
                    : bgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _focused
                      ? AppInteractions.focusBorder.borderSide.color
                      : borderColor,
                  width: _focused ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisSize: widget.fullWidth
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                mainAxisAlignment: widget.fullWidth
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, size: IconSizes.inline, color: fgColor),
                    SizedBox(width: Spacing.sm),
                  ],
                  Text(
                    widget.label,
                    style: textTheme.bodyLarge?.copyWith(
                      color: fgColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AppButtonVariant { primary, secondary, subtle }
