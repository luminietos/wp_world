// LOADS & PARSES "about.json" TO PROVIDE STRUCTURED ABOUT PAGE CONTENT
// Keeps logic separate from UI and models for clean architecture

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:wp_world/models/about/about_content.dart';
import 'package:wp_world/models/about/about_section.dart';
import 'package:wp_world/models/about/about_timeline_section.dart';
import 'package:wp_world/models/global/localized_text_block.dart';

class AboutContentLoader {
  static Future<AboutContent> load() async {
    final jsonString = await rootBundle.loadString('lib/data/about/about.json');
    final Map<String, dynamic> data = json.decode(jsonString);

    final sections = (data['sections'] as List<dynamic>).map((section) {
      return AboutSection(
        id: section['id'],
        blocks: (section['blocks'] as List<dynamic>)
            .map((b) => LocalizedTextBlock.fromJson(b))
            .toList(),
      );
    }).toList();

    final timelineSectionData = data['timelineSection'];
    final timelineSection = AboutTimelineSection(
      introBlocks: (timelineSectionData['introBlocks'] as List<dynamic>)
          .map((b) => LocalizedTextBlock.fromJson(b))
          .toList(),
    );

    return AboutContent(sections: sections, timelineSection: timelineSection);
  }
}
