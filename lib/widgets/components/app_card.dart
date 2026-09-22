// GENERIC UI COMPONENT FOR A CARD, part of my design system

import 'package:flutter/material.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/theme/app_colors.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool hoverable;
  final String? semanticsLabel;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.hoverable = true,
    this.semanticsLabel,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovering = false;
  bool _focused = false;

  void _handleActivate() {
    if (widget.onTap != null) widget.onTap!();
  }

  Border _buildBorder(ColorScheme colors) {
    if (_focused) {
      return Border.all(color: AppColors.focusRing, width: 8);
    }

    if (_hovering && widget.hoverable) {
      return Border(
        left: BorderSide(color: colors.primary, width: 8),
        bottom: BorderSide(color: colors.primary, width: 8),
        top: BorderSide(color: colors.primary, width: 0),
        right: BorderSide(color: colors.primary, width: 0),
      );
    }

    return Border.all(color: colors.primary, width: 1);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final padding = widget.padding ?? EdgeInsets.all(Spacing.lg);
    final margin = widget.margin ?? EdgeInsets.zero;

    return Semantics(
      container: true,
      button: widget.onTap != null,
      label: widget.semanticsLabel,
      child: FocusableActionDetector(
        onShowFocusHighlight: (hasFocus) => setState(() => _focused = hasFocus),
        onShowHoverHighlight: (isHovering) {
          if (widget.hoverable) setState(() => _hovering = isHovering);
        },
        mouseCursor: widget.onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (intent) => _handleActivate(),
          ),
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: margin,

            // OUTER LAYER: rounded corners only
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),

              // INNER LAYER: border only (no radius)
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                padding: padding,
                decoration: BoxDecoration(
                  color: colors.surface,
                  border: _buildBorder(colors),
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
