import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/icon_sizes.dart';

import 'language_toggle.dart';
import 'theme_toggle.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;
    final isDesktop = Responsive.isDesktop;

    final notMobileOrTablet = !isMobile && !isTablet;
    final modSpace = notMobileOrTablet ? 0.w : 12.w;
    final toggleToHambSpace = notMobileOrTablet ? 24.w : 0.w;

    return Semantics(
      container: true,
      label: 'Main navigation header',
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                ),
              ),
            ),

            // Desktop navigation
            if (isDesktop)
              Row(
                children: [
                  _NavItem(label: "Home"),
                  SizedBox(width: 32.w),
                  _NavItem(label: "Projects"),
                  SizedBox(width: 32.w),
                  _NavItem(label: "Contact"),
                ],
              ),

            // Toggles + hamburger
            Row(
              children: [
                const LanguageToggle(),
                SizedBox(width: modSpace),
                const ThemeToggle(),

                if (isMobile || isTablet) SizedBox(width: toggleToHambSpace),
                Semantics(
                  button: true,
                  label: 'Open navigation menu',
                  child: IconButton(
                    iconSize: IconSizes.standard,
                    icon: const Icon(Icons.menu),
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
  final String label;

  const _NavItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: () {
          // Later: navigation
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            label,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
