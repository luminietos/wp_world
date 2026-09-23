import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fi'),
  ];

  /// The title
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get title;

  /// WP's world title
  ///
  /// In en, this message translates to:
  /// **'Wil\'s World'**
  String get wpWorld;

  /// The description
  ///
  /// In en, this message translates to:
  /// **'This is my portfolio.'**
  String get description;

  /// Home page title
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get pagesHome;

  /// About page title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get pagesAbout;

  /// Projects page title
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get pagesProjects;

  /// Contact page title
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get pagesContact;

  /// Toggle theme title
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get themeToggle;

  /// Change language title
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get languageToggle;

  /// Language change error message
  ///
  /// In en, this message translates to:
  /// **'Language change failed'**
  String get languageToggleError;

  /// Language change error message when flag is not found
  ///
  /// In en, this message translates to:
  /// **'No flag'**
  String get languageToggleFlagError;

  /// Change language title to English
  ///
  /// In en, this message translates to:
  /// **'Change language to English'**
  String get languageToggleEN;

  /// Change language title to Finnish
  ///
  /// In en, this message translates to:
  /// **'Change language to Finnish'**
  String get languageToggleFI;

  /// Short title for Finnish language in Finnish
  ///
  /// In en, this message translates to:
  /// **'FI'**
  String get languageFI;

  /// Full title for Finnish language in Finnish
  ///
  /// In en, this message translates to:
  /// **'Finnish'**
  String get languageFinnish;

  /// Short title for English language in English
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get languageEN;

  /// Full title for English language in English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Status label
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabel;

  /// Status of project
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get statusOngoing;

  /// Status of project
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// Filter's categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesLabel;

  /// Open menu label
  ///
  /// In en, this message translates to:
  /// **'Open the menu'**
  String get openMenu;

  /// Close menu label
  ///
  /// In en, this message translates to:
  /// **'Close the menu'**
  String get closeMenu;

  /// Menu title
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menuTitle;

  /// Menu description
  ///
  /// In en, this message translates to:
  /// **'Where to next?'**
  String get menuDescription;

  /// Filter modal title
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Filter projects button text
  ///
  /// In en, this message translates to:
  /// **'Filter projects'**
  String get filterProjects;

  /// Btn text to apply filters
  ///
  /// In en, this message translates to:
  /// **'Apply filter/s'**
  String get filterApply;

  /// Reset btn for filter component
  ///
  /// In en, this message translates to:
  /// **'Reset filter/s'**
  String get filterReset;

  /// Filter error message for if no projects match specifications
  ///
  /// In en, this message translates to:
  /// **'No projects match these filters.'**
  String get errorNoProjects;

  /// No results error state
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get errorNoResults;

  /// Tech stack label
  ///
  /// In en, this message translates to:
  /// **'Tech stack'**
  String get techStack;

  /// Label for the responsive grid layout
  ///
  /// In en, this message translates to:
  /// **'Responsive grid layout'**
  String get responsiveGridLayout;

  /// Label for the page wrapper
  ///
  /// In en, this message translates to:
  /// **'Page content wrapper'**
  String get pageContentWrapper;

  /// Project 1 title
  ///
  /// In en, this message translates to:
  /// **'My Portfolio'**
  String get project01_name;

  /// The summary
  ///
  /// In en, this message translates to:
  /// **'A modern, responsive and accessible portfolio built with Flutter.'**
  String get project01_summary;

  /// No description provided for @project01_purpose.
  ///
  /// In en, this message translates to:
  /// **'This portfolio showcases my design philosophy and technical skills.'**
  String get project01_purpose;

  /// No description provided for @project01_actions.
  ///
  /// In en, this message translates to:
  /// **'Designed and developed a custom Flutter-based web portfolio...'**
  String get project01_actions;

  /// No description provided for @project01_result.
  ///
  /// In en, this message translates to:
  /// **'A cohesive personal brand identity and an engaging portfolio.'**
  String get project01_result;

  /// No description provided for @project01_date.
  ///
  /// In en, this message translates to:
  /// **'October 2025'**
  String get project01_date;

  /// No description provided for @project01_accessibility_notes.
  ///
  /// In en, this message translates to:
  /// **'WCAG AA-compliant typography and full keyboard navigation.'**
  String get project01_accessibility_notes;

  /// No description provided for @project01_collaboration.
  ///
  /// In en, this message translates to:
  /// **'Solo project with iterative design and development.'**
  String get project01_collaboration;

  /// No description provided for @project01_image1_caption.
  ///
  /// In en, this message translates to:
  /// **'Low-fidelity wireframe of the project page layout.'**
  String get project01_image1_caption;

  /// No description provided for @project01_accessibility_image1_caption.
  ///
  /// In en, this message translates to:
  /// **'Accessibility legislation and standards.'**
  String get project01_accessibility_image1_caption;

  /// Section title in a case study for purpose
  ///
  /// In en, this message translates to:
  /// **'Purpose'**
  String get projectPurpose;

  /// Client label
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get projectClient;

  /// Section title in a case study for results
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get projectResult;

  /// Project's roles' label
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get projectRoles;

  /// Section title in a case study for actions and the process
  ///
  /// In en, this message translates to:
  /// **'Actions & Process'**
  String get projectActionsProcess;

  /// Label for project metadata section
  ///
  /// In en, this message translates to:
  /// **'Project Metadata'**
  String get projectMetadata;

  /// Project type label
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get typeLabel;

  /// Section title in a case study for the collaboration, if any
  ///
  /// In en, this message translates to:
  /// **'Collaboration'**
  String get collaborationLabel;

  /// Section title in a case study for its accessibility
  ///
  /// In en, this message translates to:
  /// **'Accessibility Notes'**
  String get accessibilityNotes;

  /// Label for 'duration'
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get durationLabel;

  /// Label for images
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get imagesLabel;

  /// Kuva teksti
  ///
  /// In en, this message translates to:
  /// **'Image for {projectName}'**
  String projectImageLabel(Object projectName);

  /// For the 'view project' btn
  ///
  /// In en, this message translates to:
  /// **'View project'**
  String get projectView;

  /// For tagging purposes
  ///
  /// In en, this message translates to:
  /// **'Cross-platform'**
  String get projectTypeCrossPlatform;

  /// For tagging purposes
  ///
  /// In en, this message translates to:
  /// **'Mobile app'**
  String get projectTypeMobileApp;

  /// For tagging purposes
  ///
  /// In en, this message translates to:
  /// **'Web app'**
  String get projectTypeWebApp;

  /// A role in a project
  ///
  /// In en, this message translates to:
  /// **'Team lead'**
  String get roleTeamLead;

  /// A role in a project
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get roleDeveloper;

  /// A role in a project
  ///
  /// In en, this message translates to:
  /// **'Designer'**
  String get roleDesigner;

  /// A role in a project
  ///
  /// In en, this message translates to:
  /// **'Illustrator'**
  String get roleIllustrator;

  /// A category to tag with
  ///
  /// In en, this message translates to:
  /// **'Solo'**
  String get categorySolo;

  /// A category to tag with
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get categoryPortfolio;

  /// A category to tag with
  ///
  /// In en, this message translates to:
  /// **'Accessible'**
  String get categoryAccessible;

  /// A category to tag with
  ///
  /// In en, this message translates to:
  /// **'Wellbeing'**
  String get categoryWellbeing;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fi':
      return AppLocalizationsFi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
