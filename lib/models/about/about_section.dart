// SECTION MODEL FOR ABOUT PAGE SECTIONS
// Used for organizing and structuring the content of each section on the about page.

import 'package:wp_world/models/global/localized_text_block.dart';

class AboutSection {
  final String id;
  final List<LocalizedTextBlock> blocks;
  final String? semanticLabel;

  const AboutSection({
    required this.id,
    required this.blocks,
    this.semanticLabel,
  });
}
