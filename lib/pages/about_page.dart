import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/timeline/timeline_data.dart';
import 'package:wp_world/l10n/app_localizations.dart';

import 'package:wp_world/loaders/about_content_loader.dart';
import 'package:wp_world/models/about/about_content.dart';
import 'package:wp_world/models/about/about_section.dart';
import 'package:wp_world/models/about/about_timeline_section.dart';
import 'package:wp_world/models/global/localized_text_block.dart';

import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/widgets/components/section_header.dart';
import 'package:wp_world/widgets/components/section_content.dart';
import 'package:wp_world/widgets/timeline/timeline.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<AboutContent> _load() => AboutContentLoader.load();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return FutureBuilder<AboutContent>(
      future: _load(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final about = snapshot.data!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Spacing.lg),

              //
              // ────────────────────────────────────────────────
              // INTRO + VALUES (from about.json)
              // ────────────────────────────────────────────────
              //
              ...about.sections.map((section) {
                return Section(
                  title: null, // headings come from blocks
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildBlocks(context, section.blocks),
                  ),
                );
              }).toList(),

              //
              // ────────────────────────────────────────────────
              // TIMELINE INTRO (from about.json)
              // ────────────────────────────────────────────────
              //
              Section(
                title: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildBlocks(
                    context,
                    about.timelineSection.introBlocks,
                  ),
                ),
              ),

              //
              // ────────────────────────────────────────────────
              // TIMELINE (existing)
              // ────────────────────────────────────────────────
              //
              Section(
                title: localizations.myJourney,
                child: SizedBox(
                  height: 600,
                  child: VerticalTimeline(events: timelineEvents),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //
  // ────────────────────────────────────────────────
  // BLOCK RENDERING (headings, paragraphs, lists)
  // ────────────────────────────────────────────────
  //
  List<Widget> _buildBlocks(
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
}
