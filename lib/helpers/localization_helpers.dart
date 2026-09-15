// A HELPER FUNCTION TO LOOK UP LOCALIZED STRINGS BY KEY
// Any text can be localized dynamically using keys from JSON.

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';

String localized(BuildContext context, String key) {
  final loc = AppLocalizations.of(context)!;

  // Manual lookup map
  final map = <String, String>{
    // ALL LOCALIIZATION KEYS MUST BE ADDED HERE, otherwise the app will crash when trying to access them!
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

// Q: Why is this helper needed?
// A: Flutter’s localization system does not support dynamic key lookup by default.
