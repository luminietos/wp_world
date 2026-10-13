// RENDERS LocalizedTextBlock WITH INLINE FORMATTING, HEADINGS & LISTS

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_extensions.dart';
import 'package:wp_world/models/global/localized_text_block.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/theme/app_text_theme.dart';

class RichTextRenderer extends StatelessWidget {
  final LocalizedTextBlock block;

  const RichTextRenderer({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = AppTextTheme.textTheme;

    switch (block.type) {
      case TextBlockType.heading:
        return _buildHeading(context, localizations, textTheme);
      case TextBlockType.list:
        return _buildList(context, localizations, textTheme);
      case TextBlockType.paragraph:
      default:
        return _buildParagraph(context, localizations, textTheme);
    }
  }

  Widget _buildHeading(
    BuildContext context,
    AppLocalizations localizations,
    TextTheme textTheme,
  ) {
    final text = localizations.getString(block.key);
    final level = block.headingLevel ?? 2;

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
      label: block.semanticLabel,
      child: Padding(
        padding: EdgeInsets.only(bottom: Spacing.sm),
        child: Text(text, style: style),
      ),
    );
  }

  Widget _buildParagraph(
    BuildContext context,
    AppLocalizations localizations,
    TextTheme textTheme,
  ) {
    final text = localizations.getString(block.key);

    // Inline formatting could be parsed here (e.g., markdown-like syntax).
    // For now, render as a simple RichText with a single TextSpan.
    return Semantics(
      label: block.semanticLabel,
      child: Padding(
        padding: EdgeInsets.only(bottom: Spacing.sm),
        child: RichText(
          text: TextSpan(
            text: text,
            style: textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Optional: handle inline links if you add them later.
              },
          ),
        ),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    AppLocalizations localizations,
    TextTheme textTheme,
  ) {
    final keys = block.listKeys ?? [];

    return Semantics(
      label: block.semanticLabel,
      child: Padding(
        padding: EdgeInsets.only(bottom: Spacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: keys.map((key) {
            final itemText = localizations.getString(key);
            return Padding(
              padding: EdgeInsets.only(bottom: Spacing.xs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      itemText,
                      style: textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
