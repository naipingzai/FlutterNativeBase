// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Flutter 原生基础';

  @override
  String nativeVersion(String version) {
    return '原生版本：$version';
  }

  @override
  String get platformInfoTitle => '平台信息';

  @override
  String get labelOS => '操作系统';

  @override
  String get labelArch => 'CPU 架构';

  @override
  String get labelCompiler => '编译器';

  @override
  String get labelOSVersion => '系统版本';

  @override
  String get buttonRefresh => '刷新';

  @override
  String get buttonSwitchLang => '切换语言';

  @override
  String get loading => '加载中...';
}
