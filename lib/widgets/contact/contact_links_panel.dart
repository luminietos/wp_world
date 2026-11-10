import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/models/contact/contact_method.dart';
import 'package:wp_world/models/contact/contact_link.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wp_world/utils/icon_sizes.dart';

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
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //
          // FUTURE LOTTIE
          //
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colors.surfaceContainer,
            ),
            child: Center(
              child: Text(
                'Lottie Placeholder',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),

          SizedBox(height: Spacing.xl),

          _pill(
            context,
            label: loc.getString(emailMethod.labelKey),
            url: emailMethod.url,
          ),

          SizedBox(height: Spacing.md),

          ...links.map(
            (link) => Padding(
              padding: EdgeInsets.only(bottom: Spacing.md),
              child: _pill(
                context,
                label: loc.getString(link.labelKey),
                url: link.url,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String label) {
    switch (label.toLowerCase()) {
      case 'email':
        return Icons.email_outlined;

      case 'linkedin':
        return Icons.business_center_outlined;

      case 'github':
        return Icons.code;

      default:
        return Icons.link;
    }
  }

  Widget _pill(
    BuildContext context, {
    required String label,
    required String url,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(Spacing.xl),
        onTap: () =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.md,
          ),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(Spacing.xl),
            border: Border.all(
              color: colors.primary,
              width: AppInteractions.borderWidth,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getIcon(label),
                size: IconSizes.inline,
                color: colors.primary,
              ),

              SizedBox(width: Spacing.sm),

              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
