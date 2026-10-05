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

    'project02_name': loc.project02_name,
    'project02_summary': loc.project02_summary,
    'project02_purpose': loc.project02_purpose,
    'project02_actions': loc.project02_actions,
    'project02_result': loc.project02_result,
    'project02_date': loc.project02_date,
    'project02_accessibility_notes': loc.project02_accessibility_notes,
    'project02_collaboration': loc.project02_collaboration,
    'project02_image1_caption': loc.project02_image1_caption,
    'project02_accessibility_image1_caption':
        loc.project02_accessibility_image1_caption,

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

// FOR THE ABOUTPAGE TIMELINE (of my studies/career)
class LocalizationHelpers {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static String translate(BuildContext context, String key) {
    final loc = of(context);

    switch (key) {
      case 'timelineStudiesBBA':
        return loc.timelineStudiesBBA;
      case 'timelineWorkInternship':
        return loc.timelineWorkInternship;
      case 'timelineWorkTaigoa':
        return loc.timelineWorkTaigoa;
      default:
        return key; // fallback: show key if missing
    }
  }

  static String formatMonthYear(BuildContext context, DateTime date) {
    // For now, simple English formatting; can later localize by locale.
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  static String formatDateRange(
    BuildContext context,
    DateTime start,
    DateTime end,
  ) {
    final startStr = formatMonthYear(context, start);
    final endStr = formatMonthYear(context, end);
    return '$startStr – $endStr';
  }
}

// Q: Why is this helper needed?
// A: Flutter’s localization system does not support dynamic key lookup by default.
