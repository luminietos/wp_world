// LOADS & PARSES "contact.json" INCLUDING INTRO TEXT, METHODS & LINKS
// Provides sturctured contact page data w/o cluttering UI code or models with loading logic

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:wp_world/models/contact/contact_info.dart';
import 'package:wp_world/models/contact/contact_method.dart';
import 'package:wp_world/models/contact/contact_link.dart';
import 'package:wp_world/models/global/localized_text_block.dart';

class ContactInfoLoader {
  static Future<ContactInfo> load() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/contact/contact.json',
    );
    final Map<String, dynamic> data = json.decode(jsonString);

    final introBlocks = (data['introBlocks'] as List<dynamic>)
        .map((b) => LocalizedTextBlock.fromJson(b))
        .toList();

    final methods = (data['methods'] as List<dynamic>).map((m) {
      return ContactMethod(
        id: m['id'],
        labelKey: m['labelKey'],
        url: m['url'],
        semanticLabel: m['semanticLabel'],
      );
    }).toList();

    final links = (data['links'] as List<dynamic>).map((l) {
      return ContactLink(
        id: l['id'],
        labelKey: l['labelKey'],
        url: l['url'],
        semanticLabel: l['semanticLabel'],
      );
    }).toList();

    return ContactInfo(
      methods: methods,
      introBlocks: introBlocks,
      links: links,
    );
  }
}
