// DEFINE ALL ROUTES HERE

import 'package:auto_route/auto_route.dart';
import 'package:wp_world/pages/home_page.dart';
import 'package:wp_world/pages/about_page.dart';
import 'package:wp_world/pages/projects_page.dart';
import 'package:wp_world/pages/contact_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: ProjectsRoute.page),
    AutoRoute(page: AboutRoute.page),
    AutoRoute(page: ContactRoute.page),
  ];
}

// NOTE: Make sure you use the right syntax for AutoRoute v7.8.0 !!
