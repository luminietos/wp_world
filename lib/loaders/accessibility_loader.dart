// LOADS & PARSES "accessibility.json" FOR THE GLOBAL ACCESSIBILITY PAGE
// Keeps logic separate from UI and models for clean architecture

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:wp_world/models/accessibility/accessibility_info.dart';
import 'package:wp_world/models/global/localized_text_block.dart';

class AccessibilityLoader {
  static Future<AccessibilityInfo> load() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/accessibility/accessibility.json',
    );
    final Map<String, dynamic> data = json.decode(jsonString);

    final blocks = (data['blocks'] as List<dynamic>)
        .map((b) => LocalizedTextBlock.fromJson(b))
        .toList();

    return AccessibilityInfo(blocks: blocks);
  }
}
