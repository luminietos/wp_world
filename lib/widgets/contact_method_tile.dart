// DIRECT CONTACT METHOD TILE WITH ICONS

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/contact/contact_method.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/theme/app_interactions.dart';

class ContactMethodTile extends StatelessWidget {
  final ContactMethod method;
  final IconData icon;

  const ContactMethodTile({
    super.key,
    required this.method,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final label = localizations.getString(method.labelKey);

    return Semantics(
      label: method.semanticLabel ?? label,
      button: true,
      child: InkWell(
        onTap: () {
          // Implement navigation / launch URL / open mailto, etc.
        },
        hoverColor: AppInteractions.hoverOverlay,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Spacing.sm,
            horizontal: Spacing.sm,
          ),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
