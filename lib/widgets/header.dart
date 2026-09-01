import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/widgets/language_toggle.dart';
import 'package:wp_world/widgets/theme_toggle.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AppBar(
      title: Text(localizations.wpWorld),
      actions: const [
        // Dark mode toggle
        ThemeToggle(),

        // Language dropdown
        LanguageToggle(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
