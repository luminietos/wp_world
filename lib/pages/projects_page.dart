import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/widgets/section.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Text('Projects', style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
