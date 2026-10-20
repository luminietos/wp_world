// CENTRALIZED LOCALIZATION UTILITIES
// Contains:
// 1. Dynamic ARB key lookup (global)
// 2. Project-specific lookup
// 3. Project filter label lookup
// 4. Timeline helpers

import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';

//
// ─────────────────────────────────────────────────────────────
//   1. GLOBAL DYNAMIC ARB KEY LOOKUP
// ─────────────────────────────────────────────────────────────
//

extension AppLocalizationsDynamic on AppLocalizations {
  String getString(String key) {
    final map = <String, String>{
      // FRONTEND SKILLS
      'skillsFrontendReact': skillsFrontendReact,
      'skillsFrontendTypeScript': skillsFrontendTypeScript,
      'skillsFrontendJavaScript': skillsFrontendJavaScript,
      'skillsFrontendHTML': skillsFrontendHTML,
      'skillsFrontendCSS': skillsFrontendCSS,
      'skillsFrontendTailwind': skillsFrontendTailwind,
      'skillsFrontendBootstrap': skillsFrontendBootstrap,

      // CROSS PLATFORM
      'skillsCrossPlatformFlutter': skillsCrossPlatformFlutter,
      'skillsCrossPlatformDart': skillsCrossPlatformDart,

      // DESIGN
      'skillsDesignFigma': skillsDesignFigma,
      'skillsDesignWireframing': skillsDesignWireframing,
      'skillsDesignPrototyping': skillsDesignPrototyping,
      'skillsDesignUXUI': skillsDesignUXUI,
      'skillsDesignInformationArchitecture':
          skillsDesignInformationArchitecture,
      'skillsDesignResponsivity': skillsDesignResponsivity,
      'skillsDesignResearch': skillsDesignResearch,
      'skillsDesignDocumentation': skillsDesignDocumentation,

      // ACCESSIBILITY
      'skillsAccessibilityAccessibility': skillsAccessibilityAccessibility,
      'skillsAccessibilityWCAG': skillsAccessibilityWCAG,
      'skillsAccessibilityARIA': skillsAccessibilityARIA,
      'skillsAccessibilityUniversalDesign': skillsAccessibilityUniversalDesign,

      // BACKEND
      'skillsBackendNodeJS': skillsBackendNodeJS,
      'skillsBackendSQL': skillsBackendSQL,
      'skillsBackendMongoDB': skillsBackendMongoDB,
      'skillsBackendFirebase': skillsBackendFirebase,
      'skillsBackendMySQL': skillsBackendMySQL,

      // TOOLS
      'skillsToolsGit': skillsToolsGit,
      'skillsToolsCypress': skillsToolsCypress,
      'skillsToolsAndroidStudio': skillsToolsAndroidStudio,
      'skillsToolsVSCode': skillsToolsVSCode,

      // SOFT SKILLS
      'skillsSoftTeamwork': skillsSoftTeamwork,
      'skillsSoftCommunication': skillsSoftCommunication,
      'skillsSoftProblemSolving': skillsSoftProblemSolving,
      'skillsSoftCriticalThinking': skillsSoftCriticalThinking,
      'skillsSoftTimeManagement': skillsSoftTimeManagement,
      'skillsSoftEmpathy': skillsSoftEmpathy,
      'skillsSoftRemoteReadiness': skillsSoftRemoteReadiness,

      // CATEGORIES
      'skillCategoryFrontend': skillCategoryFrontend,
      'skillCategoryCrossPlatform': skillCategoryCrossPlatform,
      'skillCategoryBackend': skillCategoryBackend,
      'skillCategoryDesign': skillCategoryDesign,
      'skillCategoryAccessibility': skillCategoryAccessibility,
      'skillCategoryTools': skillCategoryTools,
      'skillCategorySoftSkills': skillCategorySoftSkills,

      // HOME PAGE
      'homeHeroHeading': homeHeroHeading,
      'homeHeroParagraph1': homeHeroParagraph1,
      'featuredProjectsTitle': projectsFeaturedTitle,
      'skillsTitle': skillsTitle,

      // ABOUT PAGE
      'aboutIntroHeading': aboutIntroHeading,
      'aboutIntroParagraph1': aboutIntroParagraph1,
      'aboutIntroParagraph2': aboutIntroParagraph2,
      'myJourney': myJourney,
      'aboutTimelineParagraph': aboutTimelineParagraph,
      'aboutStrengthsHeading': aboutStrengthsHeading,
      'aboutLookingForHeading': aboutLookingForHeading,
      'valuesHeading': valuesHeading,
      'valuesAccessibility': valuesAccessibility,
      'valuesCollaboration': valuesCollaboration,
      'valuesCraftsmanship': valuesCraftsmanship,
      'skillsHeading': mySkills,

      // Add more ARB keys here as needed
    };

    return map[key] ?? '**$key missing**';
  }
}

//
// ─────────────────────────────────────────────────────────────
//   2. PROJECT-SPECIFIC LOOKUP (OPTIONAL)
// ─────────────────────────────────────────────────────────────
//

String localized(BuildContext context, String key) {
  final loc = AppLocalizations.of(context)!;

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

    // Add more keys here when more projects are added!
  };

  return map[key] ?? '**$key missing**';
}

//
// ─────────────────────────────────────────────────────────────
//   3. PROJECT FILTER LABEL LOOKUP
// ─────────────────────────────────────────────────────────────
//

String localizeFilterLabel(BuildContext context, String raw) {
  final loc = AppLocalizations.of(context)!;

  switch (raw) {
    case 'mobile_app':
      return loc.projectTypeMobileApp;
    case 'cross_platform':
      return loc.projectTypeCrossPlatform;
    case 'web_app':
      return loc.projectTypeWebApp;

    case 'team_lead':
      return loc.roleTeamLead;
    case 'developer':
      return loc.roleDeveloper;
    case 'designer':
      return loc.roleDesigner;
    case 'illustrator':
      return loc.roleIllustrator;

    case 'true':
      return loc.statusOngoing;
    case 'false':
      return loc.statusCompleted;

    case 'solo':
      return loc.categorySolo;
    case 'portfolio':
      return loc.categoryPortfolio;
    case 'accessible':
      return loc.categoryAccessible;
    case 'wellbeing':
      return loc.categoryWellbeing;

    default:
      return raw; // fallback if no match is found
  }
}

//
// ─────────────────────────────────────────────────────────────
//   4. TIMELINE HELPERS
// ─────────────────────────────────────────────────────────────
//

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
        return key; // fallback if key is missing
    }
  }

  static String translateMonth(BuildContext context, String key) {
    final loc = of(context);

    switch (key) {
      case 'month1':
        return loc.month1;
      case 'month2':
        return loc.month2;
      case 'month3':
        return loc.month3;
      case 'month4':
        return loc.month4;
      case 'month5':
        return loc.month5;
      case 'month6':
        return loc.month6;
      case 'month7':
        return loc.month7;
      case 'month8':
        return loc.month8;
      case 'month9':
        return loc.month9;
      case 'month10':
        return loc.month10;
      case 'month11':
        return loc.month11;
      case 'month12':
        return loc.month12;
      default:
        return key; // fallback if month key is missing
    }
  }

  static String formatMonthYear(BuildContext context, DateTime date) {
    final monthKey = 'month${date.month}';
    final monthName = translateMonth(context, monthKey);
    return '$monthName ${date.year}';
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
