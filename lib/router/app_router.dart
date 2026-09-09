// DEFINE ALL ROUTES HERE

import 'package:auto_route/auto_route.dart';
import 'package:wp_world/pages/home_page.dart';
import 'package:wp_world/pages/about_page.dart';
import 'package:wp_world/pages/projects_page.dart';
import 'package:wp_world/pages/contact_page.dart';
import 'package:wp_world/widgets/app_shell.dart';
import 'package:wp_world/router/transitions.dart'; // custom transition

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  List<AutoRoute> get routes => [
    // Shell route: persistent Scaffold + Header + PageWrapper
    AutoRoute(
      page: AppShellRoute.page,
      path: '/',
      maintainState: true,
      children: [
        CustomRoute(
          page: HomeRoute.page,
          path: '',
          initial: true,
          maintainState: true,
          transitionsBuilder: noOverlayFadeTransition,
          durationInMilliseconds: 100,
          // reverseDurationInMilliseconds: 100,
        ),
        CustomRoute(
          page: ProjectsRoute.page,
          path: 'projects',
          maintainState: true,
          transitionsBuilder: noOverlayFadeTransition,
          durationInMilliseconds: 100,
          // reverseDurationInMilliseconds: 100,
        ),
        CustomRoute(
          page: AboutRoute.page,
          path: 'about',
          maintainState: true,
          transitionsBuilder: noOverlayFadeTransition,
          durationInMilliseconds: 100,
          // reverseDurationInMilliseconds: 100,
        ),
        CustomRoute(
          page: ContactRoute.page,
          path: 'contact',
          maintainState: true,
          transitionsBuilder: noOverlayFadeTransition,
          durationInMilliseconds: 100,
          // reverseDurationInMilliseconds: 100,
        ),
      ],
    ),
  ];
}
