import 'package:flutter/material.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/utils/spacing.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool hoverable;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.hoverable = true,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovering = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final padding = widget.padding ?? EdgeInsets.all(Spacing.lg);
    final margin = widget.margin ?? EdgeInsets.zero;

    return Semantics(
      container: true,
      button: widget.onTap != null,
      child: Focus(
        onFocusChange: (hasFocus) => setState(() => _focused = hasFocus),
        child: MouseRegion(
          cursor: widget.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          onEnter: (_) {
            if (widget.hoverable) setState(() => _hovering = true);
          },
          onExit: (_) {
            if (widget.hoverable) setState(() => _hovering = false);
          },
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: margin,
              padding: padding,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: _focused
                      ? AppInteractions.focusBorder.borderSide.color
                      : Colors.transparent,
                  width: _focused ? 2 : 1,
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                decoration: BoxDecoration(
                  color: _hovering
                      ? AppInteractions.hoverOverlay
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
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
