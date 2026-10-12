// CONTENT MODEL FOR TOP-LEVEL ABOUT PAGE CONTENT
// Used for intro, values, philosophy, and any other sections of the about page.

import 'package:wp_world/models/about/about_section.dart';
import 'package:wp_world/models/about/about_timeline_section.dart';

class AboutContent {
  final List<AboutSection> sections;
  final AboutTimelineSection timelineSection;

  const AboutContent({required this.sections, required this.timelineSection});
}
