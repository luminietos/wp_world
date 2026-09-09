import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/router/app_router.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/icon_sizes.dart';
import 'package:wp_world/utils/nav_item.dart';

import 'language_toggle.dart';
import 'theme_toggle.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;
    final isDesktop = Responsive.isDesktop;

    final notMobileOrTablet = !isMobile && !isTablet;
    final modSpace = notMobileOrTablet ? 0.w : 12.w;
    final modSpace2 = notMobileOrTablet ? 24.w : 12.w;

    return Semantics(
      container: true,
      label: 'Main navigation header',
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: colors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo / Name
            Semantics(
              header: true,
              child: Text(
                "Wilma Paloheimo",
                style: TextStyle(
                  fontSize: isMobile ? 20.sp : 28.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
            ),

            // Desktop navigation
            if (isDesktop)
              Row(
                children: [
                  _NavItem(
                    type: NavItemType.home,
                    label: localizations.pagesHome,
                  ),
                  SizedBox(width: 32.w),
                  _NavItem(
                    type: NavItemType.projects,
                    label: localizations.pagesProjects,
                  ),
                  SizedBox(width: 32.w),
                  _NavItem(
                    type: NavItemType.about,
                    label: localizations.pagesAbout,
                  ),
                  SizedBox(width: 32.w),
                  _NavItem(
                    type: NavItemType.contact,
                    label: localizations.pagesContact,
                  ),
                ],
              ),

            Row(
              children: [
                // TOGGLES
                const ThemeToggle(),
                SizedBox(width: modSpace2),
                const LanguageToggle(),

                SizedBox(width: modSpace),

                // HAMBURGER MENU (mobile/tablet)
                if (isMobile || isTablet)
                  Semantics(
                    button: true,
                    label: localizations.openMenu,
                    child: IconButton(
                      iconSize: IconSizes.standard,
                      icon: const Icon(Icons.menu),
                      color: colors.onSurface,
                      onPressed: () {
                        // Later: open drawer or bottom sheet
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);
}

class _NavItem extends StatelessWidget {
  final NavItemType type;
  final String label;

  const _NavItem({required this.type, required this.label});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: () {
          switch (type) {
            case NavItemType.home:
              context.router.push(const HomeRoute());
              break;
            case NavItemType.projects:
              context.router.push(const ProjectsRoute());
              break;
            case NavItemType.about:
              context.router.push(const AboutRoute());
              break;
            case NavItemType.contact:
              context.router.push(const ContactRoute());
              break;
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
