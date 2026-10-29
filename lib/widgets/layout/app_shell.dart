import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/widgets/layout/footer.dart';
import 'package:wp_world/widgets/layout/header.dart';
import 'package:wp_world/widgets/mobile_drawer.dart';
import 'package:wp_world/widgets/layout/page_wrapper.dart';

@RoutePage()
class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const Header(), // stays mounted
      endDrawer: const MobileDrawer(), // stays mounted, opens from the right
      body: ListView(
        children: [
          PageWrapper(
            child: const AutoRouter(), // child routes render here
          ),

          // divider + footer
          const Footer(),
        ],
      ),
    );
  }
}

// Header & MobileDrawer are mounted once and stay mounted, while the child routes render inside PageWrapper. 
// This allows for persistent navigation elements while navigating between pages.