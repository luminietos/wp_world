// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Welcome';

  @override
  String get wpWorld => 'Wil\'s World';

  @override
  String get description => 'This is my portfolio.';

  @override
  String get pagesHome => 'Home';

  @override
  String get pagesAbout => 'About';

  @override
  String get pagesProjects => 'Projects';

  @override
  String get pagesContact => 'Contact';

  @override
  String get themeToggle => 'Toggle theme';

  @override
  String get languageToggle => 'Change language';

  @override
  String get languageToggleError => 'Language change failed';

  @override
  String get languageToggleFlagError => 'No flag';

  @override
  String get languageToggleEN => 'Change language to English';

  @override
  String get languageToggleFI => 'Change language to Finnish';

  @override
  String get languageFI => 'FI';

  @override
  String get languageFinnish => 'Finnish';

  @override
  String get languageEN => 'EN';

  @override
  String get languageEnglish => 'English';

  @override
  String get statusLabel => 'Status';

  @override
  String get statusOngoing => 'Ongoing';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get categoriesLabel => 'Categories';

  @override
  String get openMenu => 'Open the menu';

  @override
  String get closeMenu => 'Close the menu';

  @override
  String get menuTitle => 'Menu';

  @override
  String get menuDescription => 'Where to next?';

  @override
  String get filter => 'Filter';

  @override
  String get filterProjects => 'Filter projects';

  @override
  String get filterApply => 'Apply filter/s';

  @override
  String get filterReset => 'Reset filter/s';

  @override
  String get errorNoProjects => 'No projects match these filters.';

  @override
  String get errorNoResults => 'No results';

  @override
  String get techStack => 'Tech stack';

  @override
  String get responsiveGridLayout => 'Responsive grid layout';

  @override
  String get pageContentWrapper => 'Page content wrapper';

  @override
  String get project01_name => 'My Portfolio';

  @override
  String get project01_summary =>
      'A modern, responsive and accessible portfolio built with Flutter.';

  @override
  String get project01_purpose =>
      'This portfolio showcases my design philosophy and technical skills.';

  @override
  String get project01_actions =>
      'Designed and developed a custom Flutter-based web portfolio...';

  @override
  String get project01_result =>
      'A cohesive personal brand identity and an engaging portfolio.';

  @override
  String get project01_date => 'October 2025';

  @override
  String get project01_accessibility_notes =>
      'WCAG AA-compliant typography and full keyboard navigation.';

  @override
  String get project01_collaboration =>
      'Solo project with iterative design and development.';

  @override
  String get project01_image1_caption =>
      'Low-fidelity wireframe of the project page layout.';

  @override
  String get project01_accessibility_image1_caption =>
      'Accessibility legislation and standards.';

  @override
  String get project02_name => 'Meaningful';

  @override
  String get project02_summary =>
      'Design and development of an accessible mental health companion app with a focus on inclusive UX and WCAG-compliant flows.';

  @override
  String get project02_purpose =>
      'To create a trustworthy, calm, and accessible digital companion that supports users in tracking mood, reflecting, and finding resources without overwhelming them.';

  @override
  String get project02_actions =>
      'I led UX and UI design, created the design system, implemented core flows in Flutter, and collaborated on content and accessibility reviews.';

  @override
  String get project02_result =>
      'The app shipped as a functional MVP with accessible navigation, clear hierarchy, and screen-reader-friendly components, ready for further clinical validation.';

  @override
  String get project02_date => '2024–2025';

  @override
  String get project02_accessibility_notes =>
      'WCAG 2.1 AA alignment for color contrast, focus order, semantic structure, and screen reader support across key flows.';

  @override
  String get project02_collaboration =>
      'Worked closely with product, content, and mental health professionals to ensure language, flows, and features felt safe and inclusive.';

  @override
  String get project02_image1_caption =>
      'Meaningful home screen with mood tracking and quick access to reflection entries.';

  @override
  String get project02_accessibility_image1_caption =>
      'Screenshot of the Meaningful app home screen showing mood tracking cards, a calm color palette, and clear navigation.';

  @override
  String get projectPurpose => 'Purpose';

  @override
  String get projectClient => 'Client';

  @override
  String get projectResult => 'Result';

  @override
  String get projectRoles => 'Roles';

  @override
  String get projectActionsProcess => 'Actions & Process';

  @override
  String get projectMetadata => 'Project Metadata';

  @override
  String get typeLabel => 'Type';

  @override
  String get collaborationLabel => 'Collaboration';

  @override
  String get accessibilityNotes => 'Accessibility Notes';

  @override
  String get durationLabel => 'Duration';

  @override
  String get imagesLabel => 'Images';

  @override
  String projectImageLabel(String projectName) {
    return 'Image for $projectName';
  }

  @override
  String projectsFound(int count) {
    return '$count projects found.';
  }

  @override
  String get oneProjectFound => '1 project found.';

  @override
  String get projectView => 'View project';

  @override
  String get projectTypeCrossPlatform => 'Cross-platform';

  @override
  String get projectTypeMobileApp => 'Mobile app';

  @override
  String get projectTypeWebApp => 'Web app';

  @override
  String get roleTeamLead => 'Team lead';

  @override
  String get roleDeveloper => 'Developer';

  @override
  String get roleDesigner => 'Designer';

  @override
  String get roleIllustrator => 'Illustrator';

  @override
  String get categorySolo => 'Solo';

  @override
  String get categoryPortfolio => 'Portfolio';

  @override
  String get categoryAccessible => 'Accessible';

  @override
  String get categoryWellbeing => 'Wellbeing';

  @override
  String filterGroupHint(int selected, int total) {
    return '$selected selected, $total options';
  }

  @override
  String get filterGroupTechStack => 'Filter group: Tech stack';

  @override
  String get filterGroupProjectType => 'Filter group: Project type';

  @override
  String get filterGroupStatus => 'Filter group: Status';

  @override
  String get filterGroupCategories => 'Filter group: Categories';

  @override
  String get filterGroupRoles => 'Filter group: Roles';
}
