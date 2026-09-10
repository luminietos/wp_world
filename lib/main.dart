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
      splitScreenMode: true,

      // IMPORTANT FIX: Use child instead of builder
      builder: (_, child) => child!,
      child: _AppRoot(ref), // ⭐ persistent router lives here
    );
  }
}

class _AppRoot extends StatefulWidget {
  final WidgetRef ref;
  const _AppRoot(this.ref);

  @override
  State<_AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<_AppRoot> {
  late final AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter(); // created once
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = widget.ref.watch(themeProvider);
    final lang = widget.ref.watch(languageProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,

      // ⭐ FIX: router is stable, no rebuild → no zoom effect
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),

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
    );
  }
}
