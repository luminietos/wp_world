// DEFINES THE TOP-LEVEL HOME PAGE CONTENT MODEL
// Includes hero text, featured skills, and featured projects sections.

import 'package:wp_world/models/home/home_featured_projects.dart';
import 'package:wp_world/models/home/home_featured_skills.dart';
import 'package:wp_world/models/home/home_hero.dart';

class HomeContent {
  final HomeHero hero;
  final HomeFeaturedSkills featuredSkills;
  final HomeFeaturedProjects featuredProjects;

  const HomeContent({
    required this.hero,
    required this.featuredSkills,
    required this.featuredProjects,
  });
}
