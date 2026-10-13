// EXTERNAL CONTACT LINK TILE, SAME SHAPE AS CONTACTMETHODTILE BUT CAN DIFFER IN COLOR

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_extensions.dart';
import 'package:wp_world/models/contact/contact_link.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/theme/app_interactions.dart';

class ContactLinkTile extends StatelessWidget {
  final ContactLink link;
  final IconData icon;

  const ContactLinkTile({super.key, required this.link, required this.icon});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final label = localizations.getString(link.labelKey);

    final color = Theme.of(context).colorScheme.secondary;

    return Semantics(
      label: link.semanticLabel ?? label,
      button: true,
      child: InkWell(
        onTap: () {
          // Implement navigation / launch URL.
        },
        hoverColor: AppInteractions.hoverOverlay,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Spacing.sm,
            horizontal: Spacing.sm,
          ),
          child: Row(
            children: [
              Icon(icon, color: color),
              SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
