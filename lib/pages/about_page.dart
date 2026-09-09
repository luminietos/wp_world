import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/widgets/section.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Text('About', style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
