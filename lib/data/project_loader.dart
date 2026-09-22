// LOADS & PARSES "projects.json", keeping loading logic easier & UI cleaner
// With this, any number of projects can be loaded without changing code.

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wp_world/models/project.dart';

class ProjectLoader {
  static Future<List<Project>> load() async {
    final jsonString = await rootBundle.loadString('lib/data/projects.json');
    final List<dynamic> data = json.decode(jsonString);

    return data.map((p) => Project.fromJson(p)).toList();
  }
}

// TODO: Change loader color to theme
