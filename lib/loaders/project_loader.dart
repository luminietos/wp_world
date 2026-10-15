// LOADS & PARSES "projects.json", keeping loading logic easier & UI cleaner
// With this, any number of projects can be loaded without changing code.

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:wp_world/models/projects/project.dart';
import 'package:wp_world/models/projects/project_image.dart';
import 'package:wp_world/models/projects/project_section.dart';
import 'package:wp_world/models/projects/project_accessibility_note.dart';

class ProjectLoader {
  static Future<List<Project>> load() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/projects/projects.json',
    );
    final List<dynamic> data = json.decode(jsonString);

    return data.map((p) => Project.fromJson(p)).toList();
  }
}
