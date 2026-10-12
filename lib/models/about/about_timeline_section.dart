// DEFINES THE ABOUT PAGE'S TIMELINE INTRO SECTION
// Provides accessible, localized text that describes the timeline events, including the date, title, and description for each event.

import 'package:wp_world/models/global/localized_text_block.dart';

class AboutTimelineSection {
  final List<LocalizedTextBlock> introBlocks;

  const AboutTimelineSection({required this.introBlocks});
}
