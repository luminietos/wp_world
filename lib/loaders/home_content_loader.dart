// LOADS & PARSES "home.json" TO PROVIDE HERO, FEATURED SKILLS & PROJECTS
// Centralizes home page content loading logic for cleaner UI code and easier maintenance

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:wp_world/models/home/home_content.dart';
import 'package:wp_world/models/home/home_hero.dart';
import 'package:wp_world/models/home/home_featured_skills.dart';
import 'package:wp_world/models/home/home_featured_projects.dart';
import 'package:wp_world/models/global/localized_text_block.dart';

class HomeContentLoader {
  static Future<HomeContent> load() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/home/home.json',
    );
    final Map<String, dynamic> data = json.decode(jsonString);

    final hero = HomeHero(
      blocks: (data['hero']['blocks'] as List<dynamic>)
          .map((b) => LocalizedTextBlock.fromJson(b))
          .toList(),
    );

    final featuredSkills = HomeFeaturedSkills(
      skillIds: List<String>.from(data['featuredSkills']['skillIds']),
    );

    final featuredProjects = HomeFeaturedProjects(
      projectIds: List<String>.from(data['featuredProjects']['projectIds']),
    );

    return HomeContent(
      hero: hero,
      featuredSkills: featuredSkills,
      featuredProjects: featuredProjects,
    );
  }
}
