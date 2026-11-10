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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.animation,
                    size: IconSizes.xl,
                    color: colors.primary,
                  ),
                  SizedBox(height: Spacing.sm),
                  Text(
                    'Lottie Placeholder',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: Spacing.xl),

          ContactLinkPill(
            label: loc.getString(emailMethod.labelKey),
            url: emailMethod.url,
          ),

          SizedBox(height: Spacing.md),

          ...links.map(
            (link) => Padding(
              padding: EdgeInsets.only(bottom: Spacing.md),
              child: ContactLinkPill(
                label: loc.getString(link.labelKey),
                url: link.url,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactLinkPill extends StatefulWidget {
  final String label;
  final String url;

  const ContactLinkPill({super.key, required this.label, required this.url});

  @override
  State<ContactLinkPill> createState() => _ContactLinkPillState();
}

class _ContactLinkPillState extends State<ContactLinkPill> {
  bool _hovered = false;
  bool _focused = false;

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

  Future<void> _launch() async {
    await launchUrl(
      Uri.parse(widget.url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: widget.label,
      child: Focus(
        onFocusChange: (focused) {
          setState(() {
            _focused = focused;
          });
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: InkWell(
            borderRadius: BorderRadius.circular(Spacing.xl),
            onTap: _launch,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.lg,
                vertical: Spacing.md,
              ),
              decoration: BoxDecoration(
                color: _hovered ? AppInteractions.hoverOverlay : colors.surface,
                borderRadius: BorderRadius.circular(Spacing.xl),
                border: Border.all(
                  color: _focused
                      ? AppInteractions.focusBorder.borderSide.color
                      : colors.primary,
                  width: _focused
                      ? AppInteractions.focusBorderWidth
                      : _hovered
                      ? AppInteractions.hoverBorderWidth
                      : AppInteractions.borderWidth,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _getIcon(widget.label),
                    size: IconSizes.inline,
                    color: colors.primary,
                  ),

                  SizedBox(width: Spacing.sm),

                  Flexible(
                    child: Text(
                      widget.label,
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
        ),
      ),
    );
  }
}
