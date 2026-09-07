import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/utils/responsive.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeProvider);

    return IconButton(
      icon: Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
      onPressed: () => ref.read(themeProvider.notifier).toggle(),
    );
  }
}
