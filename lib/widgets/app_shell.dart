import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/widgets/header.dart';
import 'package:wp_world/widgets/page_wrapper.dart';

@RoutePage()
class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(), // stays mounted
      // You can add a drawer later if you want:
      // drawer: const MobileDrawer(),
      body: PageWrapper(
        child: const AutoRouter(), // child routes render here
      ),
    );
  }
}
