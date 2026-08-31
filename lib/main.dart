import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'state/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: WPWorldApp()));
}

class WPWorldApp extends ConsumerWidget {
  const WPWorldApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'WP World',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routes: {
        '/': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
      },
    );
  }
}
