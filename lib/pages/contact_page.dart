import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/widgets/section.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Text('Contact', style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
