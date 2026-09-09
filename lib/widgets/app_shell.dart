import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/widgets/header.dart';
import 'package:wp_world/widgets/mobile_drawer.dart';
import 'package:wp_world/widgets/page_wrapper.dart';

@RoutePage()
class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(), // stays mounted
      endDrawer: const MobileDrawer(), // stays mounted, opens from the right
      body: PageWrapper(
        child: const AutoRouter(), // child routes render here
      ),
    );
  }
}

// Header & MobileDrawer are mounted once and stay mounted, while the child routes render inside PageWrapper. 
// This allows for persistent navigation elements while navigating between pages.