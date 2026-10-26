import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/models/contact/contact_method.dart';
import 'package:wp_world/models/contact/contact_link.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinksPanel extends StatelessWidget {
  final ContactMethod emailMethod;
  final List<ContactLink> links;

  const ContactLinksPanel({
    super.key,
    required this.emailMethod,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _pill(context, loc.getString(emailMethod.labelKey), emailMethod.url),
        SizedBox(height: Spacing.md),

        ...links.map((link) {
          return Padding(
            padding: EdgeInsets.only(bottom: Spacing.md),
            child: _pill(context, loc.getString(link.labelKey), link.url),
          );
        }),
      ],
    );
  }

  Widget _pill(BuildContext context, String label, String url) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.sm,
          ),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(Spacing.xl),
            border: Border.all(color: colors.primary, width: 1.5),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
