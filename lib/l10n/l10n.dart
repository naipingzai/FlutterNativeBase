import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
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
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Native Base'**
  String get appTitle;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello, World!'**
  String get helloWorld;

  /// No description provided for @counterLabel.
  ///
  /// In en, this message translates to:
  /// **'Button tapped {count} times'**
  String counterLabel(int count);

  /// No description provided for @nativeAddResult.
  ///
  /// In en, this message translates to:
  /// **'Native add result: {result}'**
  String nativeAddResult(int result);

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String version(String version);

  /// No description provided for @arithmeticSection.
  ///
  /// In en, this message translates to:
  /// **'Arithmetic (sum / multiply)'**
  String get arithmeticSection;

  /// No description provided for @mathSection.
  ///
  /// In en, this message translates to:
  /// **'Math (factorial / fibonacci)'**
  String get mathSection;

  /// No description provided for @arraySection.
  ///
  /// In en, this message translates to:
  /// **'Array (sum_array)'**
  String get arraySection;

  /// No description provided for @stringSection.
  ///
  /// In en, this message translates to:
  /// **'String (to_upper)'**
  String get stringSection;

  /// No description provided for @labelA.
  ///
  /// In en, this message translates to:
  /// **'a'**
  String get labelA;

  /// No description provided for @labelB.
  ///
  /// In en, this message translates to:
  /// **'b'**
  String get labelB;

  /// No description provided for @labelFactorialN.
  ///
  /// In en, this message translates to:
  /// **'n (factorial)'**
  String get labelFactorialN;

  /// No description provided for @labelFibonacciN.
  ///
  /// In en, this message translates to:
  /// **'n (fibonacci)'**
  String get labelFibonacciN;

  /// No description provided for @labelCommaIntegers.
  ///
  /// In en, this message translates to:
  /// **'Comma-separated integers'**
  String get labelCommaIntegers;

  /// No description provided for @labelInputString.
  ///
  /// In en, this message translates to:
  /// **'Input string'**
  String get labelInputString;

  /// No description provided for @buttonAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get buttonAdd;

  /// No description provided for @buttonMultiply.
  ///
  /// In en, this message translates to:
  /// **'Multiply'**
  String get buttonMultiply;

  /// No description provided for @buttonFactorial.
  ///
  /// In en, this message translates to:
  /// **'Factorial'**
  String get buttonFactorial;

  /// No description provided for @buttonFibonacci.
  ///
  /// In en, this message translates to:
  /// **'Fibonacci'**
  String get buttonFibonacci;

  /// No description provided for @buttonSumArray.
  ///
  /// In en, this message translates to:
  /// **'Sum Array'**
  String get buttonSumArray;

  /// No description provided for @buttonToUpper.
  ///
  /// In en, this message translates to:
  /// **'To Upper'**
  String get buttonToUpper;

  /// No description provided for @resultAdd.
  ///
  /// In en, this message translates to:
  /// **'Add: {value}'**
  String resultAdd(String value);

  /// No description provided for @resultMultiply.
  ///
  /// In en, this message translates to:
  /// **'Multiply: {value}'**
  String resultMultiply(String value);

  /// No description provided for @resultFactorial.
  ///
  /// In en, this message translates to:
  /// **'Factorial: {value}'**
  String resultFactorial(String value);

  /// No description provided for @resultFibonacci.
  ///
  /// In en, this message translates to:
  /// **'Fibonacci: {value}'**
  String resultFibonacci(String value);

  /// No description provided for @resultArraySum.
  ///
  /// In en, this message translates to:
  /// **'Array sum: {value}'**
  String resultArraySum(String value);

  /// No description provided for @resultToUpper.
  ///
  /// In en, this message translates to:
  /// **'Result: {value}'**
  String resultToUpper(String value);
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
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
