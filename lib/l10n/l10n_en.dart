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
  String get helloWorld => 'Hello, World!';

  @override
  String counterLabel(int count) {
    return 'Button tapped $count times';
  }

  @override
  String nativeAddResult(int result) {
    return 'Native add result: $result';
  }

  @override
  String version(String version) {
    return 'Version: $version';
  }

  @override
  String get arithmeticSection => 'Arithmetic (sum / multiply)';

  @override
  String get mathSection => 'Math (factorial / fibonacci)';

  @override
  String get arraySection => 'Array (sum_array)';

  @override
  String get stringSection => 'String (to_upper)';

  @override
  String get labelA => 'a';

  @override
  String get labelB => 'b';

  @override
  String get labelFactorialN => 'n (factorial)';

  @override
  String get labelFibonacciN => 'n (fibonacci)';

  @override
  String get labelCommaIntegers => 'Comma-separated integers';

  @override
  String get labelInputString => 'Input string';

  @override
  String get buttonAdd => 'Add';

  @override
  String get buttonMultiply => 'Multiply';

  @override
  String get buttonFactorial => 'Factorial';

  @override
  String get buttonFibonacci => 'Fibonacci';

  @override
  String get buttonSumArray => 'Sum Array';

  @override
  String get buttonToUpper => 'To Upper';

  @override
  String resultAdd(String value) {
    return 'Add: $value';
  }

  @override
  String resultMultiply(String value) {
    return 'Multiply: $value';
  }

  @override
  String resultFactorial(String value) {
    return 'Factorial: $value';
  }

  @override
  String resultFibonacci(String value) {
    return 'Fibonacci: $value';
  }

  @override
  String resultArraySum(String value) {
    return 'Array sum: $value';
  }

  @override
  String resultToUpper(String value) {
    return 'Result: $value';
  }
}
