// DEFINES A STRUCTURED MODEL FOR A PROJECT CASE STUDY (including all metadata, images, and sections)
// This is the main model used in the app.

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_helpers.dart';
import 'project_image.dart';
import 'project_section.dart';

class Project {
  // IDENTIFIERS
  final String id; // unique identifier for the project
  final String slug; // unique slug for the project, used in URLs

  // LOCALIZATION KEYS
  final String nameKey;
  final String summaryKey;
  final String purposeKey;
  final String actionsKey;
  final String resultKey;
  final String dateKey;
  final String accessibilityNotesKey;
  final String collaborationKey;

  // METADATA
  final String projectType;
  final bool isOngoing;
  final String projectLink;
  final String clientOrCompany;
  final String duration;

  final String logoPath;

  final List<Map<String, dynamic>> techStack;
  final List<String> rolesStack;
  final List<String> categories;

  final List<ProjectImage> imagePaths;
  final List<ProjectImage> accessibilityImages;

  final List<ProjectSection>? sections;

  Project({
    required this.id,
    required this.slug,
    required this.nameKey,
    required this.summaryKey,
    required this.purposeKey,
    required this.actionsKey,
    required this.resultKey,
    required this.dateKey,
    required this.accessibilityNotesKey,
    required this.collaborationKey,
    required this.projectType,
    required this.isOngoing,
    required this.projectLink,
    required this.clientOrCompany,
    required this.duration,
    required this.logoPath,
    required this.techStack,
    required this.rolesStack,
    required this.categories,
    required this.imagePaths,
    required this.accessibilityImages,
    this.sections,
  });

  // HELPER METHODS to get localized strings for the project
  String name(BuildContext context) => localized(context, nameKey);
  String summary(BuildContext context) => localized(context, summaryKey);
  String purpose(BuildContext context) => localized(context, purposeKey);
  String actions(BuildContext context) => localized(context, actionsKey);
  String result(BuildContext context) => localized(context, resultKey);
  String date(BuildContext context) => localized(context, dateKey);
  String accessibilityNotes(BuildContext context) =>
      localized(context, accessibilityNotesKey);
  String collaboration(BuildContext context) =>
      localized(context, collaborationKey);

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      slug: json['slug'],

      nameKey: json['name_key'],
      summaryKey: json['summary_key'],
      purposeKey: json['purpose_key'],
      actionsKey: json['actions_key'],
      resultKey: json['result_key'],
      dateKey: json['date_key'],
      accessibilityNotesKey: json['accessibility_notes_key'],
      collaborationKey: json['collaboration_key'],

      projectType: json['projectType'],
      isOngoing: json['isOngoing'],
      projectLink: json['projectLink'],
      clientOrCompany: json['clientOrCompany'],
      duration: json['duration'],

      logoPath: json['logoPath'],

      techStack: List<Map<String, dynamic>>.from(json['techStack']),
      rolesStack: List<String>.from(json['rolesStack']),
      categories: List<String>.from(json['categories']),

      imagePaths: (json['imagePaths'] as List<dynamic>)
          .map((i) => ProjectImage.fromJson(i))
          .toList(),

      accessibilityImages: (json['accessibilityImages'] as List<dynamic>)
          .map((i) => ProjectImage.fromJson(i))
          .toList(),

      sections: json['sections'] != null
          ? (json['sections'] as List<dynamic>)
                .map((s) => ProjectSection.fromJson(s))
                .toList()
          : null,
    );
  }
}
