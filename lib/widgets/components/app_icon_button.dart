import 'package:flutter/material.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/utils/icon_sizes.dart';
import 'package:wp_world/utils/spacing.dart';

class AppIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String semanticsLabel;
  final AppIconButtonVariant variant;
  final double size; // optional override

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.semanticsLabel,
    this.variant = AppIconButtonVariant.subtle,
    this.size = IconSizes.standard,
  });

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool _hovering = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Determine colors based on variant
    final Color baseBg;
    final Color fgColor;
    final Color borderColor;

    switch (widget.variant) {
      case AppIconButtonVariant.primary:
        baseBg = colors.primary;
        fgColor = colors.onPrimary;
        borderColor = Colors.transparent;
        break;

      case AppIconButtonVariant.secondary:
        baseBg = colors.secondary;
        fgColor = colors.onSecondary;
        borderColor = Colors.transparent;
        break;

      case AppIconButtonVariant.subtle:
        baseBg = Colors.transparent;
        fgColor = colors.onSurface;
        borderColor = colors.outline;
        break;
    }

    // HOVER STATE
    final Color bgColor = widget.variant == AppIconButtonVariant.subtle
        ? (_hovering ? AppInteractions.hoverOverlay : baseBg)
        : (_hovering ? baseBg.withValues(alpha: 0.9) : baseBg);

    return Semantics(
      button: true,
      label: widget.semanticsLabel,
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
              padding: EdgeInsets.all(Spacing.sm),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _focused
                      ? AppInteractions.focusBorder.borderSide.color
                      : borderColor,
                  width: _focused ? 2 : 1,
                ),
              ),
              child: Icon(widget.icon, size: widget.size, color: fgColor),
            ),
          ),
        ),
      ),
    );
  }
}

// Variants for consistent styling
enum AppIconButtonVariant { primary, secondary, subtle }
