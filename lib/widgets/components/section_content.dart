// RENDERS A LIST OF LocalizedTextBlock, SPACING CONTROLLED BY PARENT

import 'package:flutter/material.dart';
import 'package:wp_world/models/global/localized_text_block.dart';
import 'package:wp_world/widgets/components/rich_text_renderer.dart';

class SectionContent extends StatelessWidget {
  final List<LocalizedTextBlock> blocks;

  const SectionContent({super.key, required this.blocks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map((block) {
        return RichTextRenderer(block: block);
      }).toList(),
    );
  }
}
