// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Native Base';

  @override
  String nativeVersion(String version) {
    return 'Native Version: $version';
  }

  @override
  String get platformInfoTitle => 'Platform Info';

  @override
  String get labelOS => 'Operating System';

  @override
  String get labelArch => 'Architecture';

  @override
  String get labelCompiler => 'Compiler';

  @override
  String get labelOSVersion => 'OS Version';

  @override
  String get buttonRefresh => 'Refresh';

  @override
  String get buttonSwitchLang => 'Switch Language';

  @override
  String get loading => 'Loading...';
}
