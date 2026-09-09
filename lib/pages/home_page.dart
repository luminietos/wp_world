import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';

import 'package:wp_world/widgets/section.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Section(
      child: Center(
        child: Text(
          localizations.title,
          style: TextStyle(color: colors.onSurface),
        ),
      ),
    );
  }
}
