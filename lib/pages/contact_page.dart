import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/loaders/contact_info_loader.dart';
import 'package:wp_world/models/contact/contact_info.dart';
import 'package:wp_world/models/global/localized_text_block.dart';
import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/widgets/components/section_header.dart';
import 'package:wp_world/widgets/components/section_content.dart';
import 'package:wp_world/widgets/contact/contact_form.dart';
import 'package:wp_world/widgets/contact/contact_links_panel.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/spacing.dart';

@RoutePage()
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late final Future<ContactInfo> _contactFuture;

  @override
  void initState() {
    super.initState();
    _contactFuture = ContactInfoLoader.load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ContactInfo>(
      future: _contactFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final contactInfo = snapshot.data!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Spacing.lg),

              Section(
                title: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildIntroBlocks(context, contactInfo.introBlocks),
                ),
              ),

              Section(
                title: null,
                child: _buildFormAndLinks(context, contactInfo),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildIntroBlocks(
    BuildContext context,
    List<LocalizedTextBlock> blocks,
  ) {
    final widgets = <Widget>[];

    for (final block in blocks) {
      if (block.type == TextBlockType.heading) {
        widgets.add(SectionHeader(headingBlock: block));
        widgets.add(SizedBox(height: Spacing.sm));
      } else {
        widgets.add(SectionContent(blocks: [block]));
      }
    }

    return widgets;
  }

  Widget _buildFormAndLinks(BuildContext context, ContactInfo contactInfo) {
    final emailMethod = contactInfo.methods.firstWhere((m) => m.id == 'email');

    final isMobile = Responsive.isMobile;

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactForm(),
          SizedBox(height: Spacing.xl),
          ContactLinksPanel(emailMethod: emailMethod, links: contactInfo.links),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: ContactForm()),
        SizedBox(width: Spacing.xl),
        Expanded(
          flex: 1,
          child: ContactLinksPanel(
            emailMethod: emailMethod,
            links: contactInfo.links,
          ),
        ),
      ],
    );
  }
}
