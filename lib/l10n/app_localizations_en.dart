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
  String get themeToggle => 'Toggle theme';

  @override
  String get languageToggle => 'Change language';
}
