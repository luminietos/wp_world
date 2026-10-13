import 'package:flutter/material.dart';
import 'package:wp_world/l10n/app_localizations.dart';

extension AppLocalizationsDynamic on AppLocalizations {
  /// Dynamically resolve any ARB key by name.
  /// Example: localizations.getString("skillsFrontendReact")
  String getString(String key) {
    final mirror = this;
    final map = <String, String>{
      // AUTO-GENERATED KEYS (Flutter creates getters for each ARB key)
      // We reflect them manually here:

      // FRONTEND SKILLS
      'skillsFrontendReact': mirror.skillsFrontendReact,
      'skillsFrontendTypeScript': mirror.skillsFrontendTypeScript,
      'skillsFrontendJavaScript': mirror.skillsFrontendJavaScript,
      'skillsFrontendHTML': mirror.skillsFrontendHTML,
      'skillsFrontendCSS': mirror.skillsFrontendCSS,
      'skillsFrontendTailwind': mirror.skillsFrontendTailwind,
      'skillsFrontendBootstrap': mirror.skillsFrontendBootstrap,

      // CROSS PLATFORM
      'skillsCrossPlatformFlutter': mirror.skillsCrossPlatformFlutter,
      'skillsCrossPlatformDart': mirror.skillsCrossPlatformDart,

      // DESIGN
      'skillsDesignFigma': mirror.skillsDesignFigma,
      'skillsDesignWireframing': mirror.skillsDesignWireframing,
      'skillsDesignPrototyping': mirror.skillsDesignPrototyping,
      'skillsDesignUXUI': mirror.skillsDesignUXUI,
      'skillsDesignInformationArchitecture':
          mirror.skillsDesignInformationArchitecture,
      'skillsDesignResponsivity': mirror.skillsDesignResponsivity,
      'skillsDesignResearch': mirror.skillsDesignResearch,
      'skillsDesignDocumentation': mirror.skillsDesignDocumentation,

      // ACCESSIBILITY
      'skillsAccessibilityAccessibility':
          mirror.skillsAccessibilityAccessibility,
      'skillsAccessibilityWCAG': mirror.skillsAccessibilityWCAG,
      'skillsAccessibilityARIA': mirror.skillsAccessibilityARIA,
      'skillsAccessibilityUniversalDesign':
          mirror.skillsAccessibilityUniversalDesign,

      // BACKEND
      'skillsBackendNodeJS': mirror.skillsBackendNodeJS,
      'skillsBackendSQL': mirror.skillsBackendSQL,
      'skillsBackendMongoDB': mirror.skillsBackendMongoDB,
      'skillsBackendFirebase': mirror.skillsBackendFirebase,
      'skillsBackendMySQL': mirror.skillsBackendMySQL,

      // TOOLS
      'skillsToolsGit': mirror.skillsToolsGit,
      'skillsToolsCypress': mirror.skillsToolsCypress,
      'skillsToolsAndroidStudio': mirror.skillsToolsAndroidStudio,
      'skillsToolsVSCode': mirror.skillsToolsVSCode,

      // SOFT SKILLS
      'skillsSoftTeamwork': mirror.skillsSoftTeamwork,
      'skillsSoftCommunication': mirror.skillsSoftCommunication,
      'skillsSoftProblemSolving': mirror.skillsSoftProblemSolving,
      'skillsSoftCriticalThinking': mirror.skillsSoftCriticalThinking,
      'skillsSoftTimeManagement': mirror.skillsSoftTimeManagement,
      'skillsSoftEmpathy': mirror.skillsSoftEmpathy,
      'skillsSoftRemoteReadiness': mirror.skillsSoftRemoteReadiness,

      // CATEGORIES
      'skillCategoryFrontend': mirror.skillCategoryFrontend,
      'skillCategoryCrossPlatform': mirror.skillCategoryCrossPlatform,
      'skillCategoryBackend': mirror.skillCategoryBackend,
      'skillCategoryDesign': mirror.skillCategoryDesign,
      'skillCategoryAccessibility': mirror.skillCategoryAccessibility,
      'skillCategoryTools': mirror.skillCategoryTools,
      'skillCategorySoftSkills': mirror.skillCategorySoftSkills,
    };

    return map[key] ?? '**$key missing**';
  }
}
