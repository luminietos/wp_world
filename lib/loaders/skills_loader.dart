// LOADS & PARSES "skills.json" TO PROVIDE ALL SKILLS & SKILL CATEGORIES
// Used by multpiple pages for filtering, display & featured sections

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:wp_world/models/skills/skill.dart';
import 'package:wp_world/models/skills/skill_category.dart';

class SkillsLoader {
  static Future<Map<String, dynamic>> load() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/skills/skills.json',
    );
    final Map<String, dynamic> data = json.decode(jsonString);

    final skills = (data['skills'] as List<dynamic>).map((s) {
      return Skill(id: s['id'], labelKey: s['labelKey']);
    }).toList();

    final categories = (data['categories'] as List<dynamic>).map((c) {
      return SkillCategory(
        id: c['id'],
        labelKey: c['labelKey'],
        skillIds: List<String>.from(c['skillIds']),
      );
    }).toList();

    return {'skills': skills, 'categories': categories};
  }
}
