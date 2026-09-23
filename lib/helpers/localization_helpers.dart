// A HELPER FUNCTION TO LOOK UP LOCALIZED STRINGS BY KEY
// Any text can be localized dynamically using keys from JSON.

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';

// FOR INDIVIDUAL PROJECTS' TEXTS
String localized(BuildContext context, String key) {
  final loc = AppLocalizations.of(context)!;

  // Manual lookup map
  final map = <String, String>{
    'project01_name': loc.project01_name,
    'project01_summary': loc.project01_summary,
    'project01_purpose': loc.project01_purpose,
    'project01_actions': loc.project01_actions,
    'project01_result': loc.project01_result,
    'project01_date': loc.project01_date,
    'project01_accessibility_notes': loc.project01_accessibility_notes,
    'project01_collaboration': loc.project01_collaboration,
    'project01_image1_caption': loc.project01_image1_caption,
    'project01_accessibility_image1_caption':
        loc.project01_accessibility_image1_caption,

    // Add more keys here as needed.
  };

  if (!map.containsKey(key)) {
    return '**$key missing**';
  }

  return map[key]!;
}

// FOR THE PROJECT FILTERING
String localizeFilterLabel(BuildContext context, String raw) {
  final loc = AppLocalizations.of(context)!;

  switch (raw) {
    // PROJECT TYPES
    case 'mobile_app':
      return loc.projectTypeMobileApp;
    case 'cross_platform':
      return loc.projectTypeCrossPlatform;
    case 'web_app':
      return loc.projectTypeWebApp;

    // ROLES
    case 'team_lead':
      return loc.roleTeamLead;
    case 'developer':
      return loc.roleDeveloper;
    case 'designer':
      return loc.roleDesigner;
    case 'illustrator':
      return loc.roleIllustrator;

    // STATUS
    case 'true':
      return loc.statusOngoing;
    case 'false':
      return loc.statusCompleted;

    // CATEGORIES
    case 'solo':
      return loc.categorySolo;
    case 'portfolio':
      return loc.categoryPortfolio;
    case 'accessible':
      return loc.categoryAccessible;
    case 'wellbeing':
      return loc.categoryWellbeing;

    default:
      return raw; // fallback
  }
}

// Q: Why is this helper needed?
// A: Flutter’s localization system does not support dynamic key lookup by default.
