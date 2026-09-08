import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/widgets/header.dart';
import 'package:wp_world/widgets/page_wrapper.dart';
import 'package:wp_world/widgets/section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const Header(),
      body: PageWrapper(
        child: Section(
          child: Center(
            child: Text(
              localizations.title,
              style: TextStyle(color: colors.onSurface),
            ),
          ),
        ),
      ),
    );
  }
}
