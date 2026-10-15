// RENDERS A HEADING LocalizedTextBlock, SPACING CONTROLLED BY PARENT

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/global/localized_text_block.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/theme/app_text_theme.dart';

class SectionHeader extends StatelessWidget {
  final LocalizedTextBlock headingBlock;

  const SectionHeader({super.key, required this.headingBlock});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = AppTextTheme.textTheme;

    final text = localizations.getString(headingBlock.key);
    final level = headingBlock.headingLevel ?? 2;

    TextStyle style;
    switch (level) {
      case 1:
        style = textTheme.headlineLarge!;
        break;
      case 2:
        style = textTheme.headlineMedium!;
        break;
      case 3:
        style = textTheme.headlineSmall!;
        break;
      default:
        style = textTheme.titleMedium!;
        break;
    }

    return Semantics(
      header: true,
      label: headingBlock.semanticLabel,
      child: Text(text, style: style),
    );
  }
}
