import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/widgets/section.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Section(
          title: localizations.pagesAbout,
          description: Text("TODO: description"),
          child: Center(child: Text("TODO: content")),
        ),
      ],
    );
  }
}
