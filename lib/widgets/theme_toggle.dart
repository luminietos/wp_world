import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wp_world/utils/icon_sizes.dart';
import '../state/theme_provider.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeProvider);
    final colors = Theme.of(context).colorScheme;

    return IconButton(
      iconSize: IconSizes.standard,
      icon: Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
      onPressed: () => ref.read(themeProvider.notifier).toggle(),
      color: colors.onSurface,
    );
  }
}
