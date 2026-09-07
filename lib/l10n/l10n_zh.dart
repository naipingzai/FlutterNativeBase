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
  String get helloWorld => '你好，世界！';

  @override
  String counterLabel(int count) {
    return '按钮点击了 $count 次';
  }

  @override
  String nativeAddResult(int result) {
    return '原生加法结果：$result';
  }

  @override
  String version(String version) {
    return '版本：$version';
  }

  @override
  String get arithmeticSection => '算术运算（加法 / 乘法）';

  @override
  String get mathSection => '数学运算（阶乘 / 斐波那契）';

  @override
  String get arraySection => '数组（求和）';

  @override
  String get stringSection => '字符串（转大写）';

  @override
  String get labelA => 'a';

  @override
  String get labelB => 'b';

  @override
  String get labelFactorialN => 'n（阶乘）';

  @override
  String get labelFibonacciN => 'n（斐波那契）';

  @override
  String get labelCommaIntegers => '逗号分隔的整数';

  @override
  String get labelInputString => '输入字符串';

  @override
  String get buttonAdd => '加法';

  @override
  String get buttonMultiply => '乘法';

  @override
  String get buttonFactorial => '阶乘';

  @override
  String get buttonFibonacci => '斐波那契';

  @override
  String get buttonSumArray => '数组求和';

  @override
  String get buttonToUpper => '转大写';

  @override
  String resultAdd(String value) {
    return '加法：$value';
  }

  @override
  String resultMultiply(String value) {
    return '乘法：$value';
  }

  @override
  String resultFactorial(String value) {
    return '阶乘：$value';
  }

  @override
  String resultFibonacci(String value) {
    return '斐波那契：$value';
  }

  @override
  String resultArraySum(String value) {
    return '数组求和：$value';
  }

  @override
  String resultToUpper(String value) {
    return '结果：$value';
  }
}
