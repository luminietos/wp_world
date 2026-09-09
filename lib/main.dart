import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/router/app_router.dart';
import 'package:wp_world/theme/app_color_scheme.dart';
import 'package:wp_world/theme/app_text_theme.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'state/language_provider.dart';
import 'state/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024), // desktop-first
      minTextAdapt: true,
      builder: (_, __) {
        final themeMode = ref.watch(themeProvider);
        final lang = ref.watch(languageProvider); // "en" or "fi"

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,

          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'NotoSans',
            colorScheme: AppColorScheme.light,
            textTheme: AppTextTheme.textTheme,
            useMaterial3: true,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'NotoSans',
            colorScheme: AppColorScheme.dark,
            textTheme: AppTextTheme.textTheme,
            useMaterial3: true,
          ),

          locale: Locale(lang),
          supportedLocales: const [Locale('en'), Locale('fi')],

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          routerDelegate: AppRouter().delegate(),
          routeInformationParser: AppRouter().defaultRouteParser(),
        );
      },
    );
  }
}
