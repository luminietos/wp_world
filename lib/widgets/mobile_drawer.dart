import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/router/app_router.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/widgets/components/app_button.dart';
import 'package:wp_world/widgets/components/app_icon_button.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    return Semantics(
      container: true,
      label: localizations.openMenu,
      child: Drawer(
        elevation: 16,
        backgroundColor: colors.surface,
        child: SafeArea(
          child: FocusTraversalGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DRAWER HEADER
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Spacing.lg,
                    horizontal: Spacing.lg,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.menuDescription,
                        style: textTheme.headlineSmall?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // CLOSE ICON BTN
                      AppIconButton(
                        icon: Icons.menu,
                        semanticsLabel: localizations.openMenu,
                        variant: AppIconButtonVariant.subtle,
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    ],
                  ),
                ),

                Divider(
                  thickness: 2.h,
                  color: Theme.of(context).colorScheme.primary,
                ),

                // ⭐ Navigation items
                _DrawerItem(
                  icon: Icons.home_outlined,
                  label: localizations.pagesHome,
                  onTap: () {
                    context.router.navigate(const HomeRoute());
                    Navigator.of(context).pop();
                  },
                ),

                _DrawerItem(
                  icon: Icons.work_outline,
                  label: localizations.pagesProjects,
                  onTap: () {
                    context.router.navigate(const ProjectsRoute());
                    Navigator.of(context).pop();
                  },
                ),

                _DrawerItem(
                  icon: Icons.info_outline,
                  label: localizations.pagesAbout,
                  onTap: () {
                    context.router.navigate(const AboutRoute());
                    Navigator.of(context).pop();
                  },
                ),

                _DrawerItem(
                  icon: Icons.mail_outline,
                  label: localizations.pagesContact,
                  onTap: () {
                    context.router.navigate(const ContactRoute());
                    Navigator.of(context).pop();
                  },
                ),

                const Spacer(),

                // CLOSE BTN (must be closable via keyboard)
                Padding(
                  padding: EdgeInsets.all(Spacing.lg),
                  child: Center(
                    child: AppButton(
                      label: localizations.closeMenu,
                      icon: Icons.close,
                      variant: AppButtonVariant.subtle,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ⭐ Accessible, Abra‑compliant drawer item
class _DrawerItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<_DrawerItem> {
  bool _hovering = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      button: true,
      label: widget.label,
      child: Focus(
        onFocusChange: (hasFocus) => setState(() => _focused = hasFocus),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: Spacing.lg,
                horizontal: Spacing.lg,
              ),
              decoration: BoxDecoration(
                color: _hovering
                    ? AppInteractions.hoverOverlay
                    : Colors.transparent,
                border: _focused
                    ? Border.all(color: colors.primary, width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  Icon(widget.icon, color: colors.onSurface),
                  SizedBox(width: Spacing.md),
                  Text(
                    widget.label,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.onSurface,
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
