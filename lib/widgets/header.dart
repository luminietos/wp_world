import 'package:flutter/material.dart';
import 'package:wp_world/widgets/language_toggle.dart';
import 'package:wp_world/widgets/themee_toggle.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("WP World"),
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
