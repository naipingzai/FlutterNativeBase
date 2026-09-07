import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/l10n.dart';
import 'src/ffi/native_bindings.dart' as native;

void main() {
  runApp(const FlutterNativeBaseApp());
}

class FlutterNativeBaseApp extends StatelessWidget {
  const FlutterNativeBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Native Base',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _aCtrl = TextEditingController(text: '12');
  final _bCtrl = TextEditingController(text: '34');
  final _factCtrl = TextEditingController(text: '12');
  final _fibCtrl = TextEditingController(text: '20');
  final _arrCtrl = TextEditingController(text: '1,2,3,4,5,6,7,8,9,10');
  final _strCtrl = TextEditingController(text: 'hello from C!');

  String _addRes = '-';
  String _mulRes = '-';
  String _factRes = '-';
  String _fibRes = '-';
  String _arrRes = '-';
  String _strRes = '-';
  String _version = '-';

  @override
  void initState() {
    super.initState();
    try { _version = native.version; } catch (_) { _version = '(error)'; }
  }

  void _doAdd() {
    final a = int.tryParse(_aCtrl.text) ?? 0;
    final b = int.tryParse(_bCtrl.text) ?? 0;
    setState(() => _addRes = '${native.sum(a, b)}');
  }

  void _doMul() {
    final a = int.tryParse(_aCtrl.text) ?? 0;
    final b = int.tryParse(_bCtrl.text) ?? 0;
    setState(() => _mulRes = '${native.multiply(a, b)}');
  }

  void _doFact() {
    final n = int.tryParse(_factCtrl.text) ?? 0;
    setState(() => _factRes = '${native.factorial(n)}');
  }

  void _doFib() {
    final n = int.tryParse(_fibCtrl.text) ?? 0;
    setState(() => _fibRes = '${native.fibonacci(n)}');
  }

  void _doSumArr() {
    final list = _arrCtrl.text.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList();
    setState(() => _arrRes = '${native.sumArray(list)}');
  }

  void _doUpper() {
    setState(() => _strRes = native.toUpper(_strCtrl.text));
  }

  @override
  void dispose() {
    _aCtrl.dispose(); _bCtrl.dispose(); _factCtrl.dispose();
    _fibCtrl.dispose(); _arrCtrl.dispose(); _strCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(l10n.appTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l10n.version(_version), style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text('C compiled via hook/build.dart (package_ffi)', style: theme.textTheme.bodySmall),
            ]),
          )),
          const SizedBox(height: 12),
          _sec(l10n.arithmeticSection),
          Row(children: [
            Expanded(child: TextField(controller: _aCtrl, decoration: InputDecoration(labelText: l10n.labelA), keyboardType: TextInputType.number)),
            const SizedBox(width: 8),
            Expanded(child: TextField(controller: _bCtrl, decoration: InputDecoration(labelText: l10n.labelB), keyboardType: TextInputType.number)),
          ]),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            FilledButton(onPressed: _doAdd, child: Text(l10n.buttonAdd)),
            FilledButton(onPressed: _doMul, child: Text(l10n.buttonMultiply)),
          ]),
          Text(l10n.resultAdd(_addRes), style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(l10n.resultMultiply(_mulRes), style: const TextStyle(fontWeight: FontWeight.bold)),
          const Divider(height: 32),
          _sec(l10n.mathSection),
          Row(children: [
            Expanded(child: TextField(controller: _factCtrl, decoration: InputDecoration(labelText: l10n.labelFactorialN), keyboardType: TextInputType.number)),
            const SizedBox(width: 8),
            Expanded(child: TextField(controller: _fibCtrl, decoration: InputDecoration(labelText: l10n.labelFibonacciN), keyboardType: TextInputType.number)),
          ]),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            FilledButton(onPressed: _doFact, child: Text(l10n.buttonFactorial)),
            FilledButton(onPressed: _doFib, child: Text(l10n.buttonFibonacci)),
          ]),
          Text(l10n.resultFactorial(_factRes), style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(l10n.resultFibonacci(_fibRes), style: const TextStyle(fontWeight: FontWeight.bold)),
          const Divider(height: 32),
          _sec(l10n.arraySection),
          TextField(controller: _arrCtrl, decoration: InputDecoration(labelText: l10n.labelCommaIntegers)),
          const SizedBox(height: 8),
          FilledButton(onPressed: _doSumArr, child: Text(l10n.buttonSumArray)),
          Text(l10n.resultArraySum(_arrRes), style: const TextStyle(fontWeight: FontWeight.bold)),
          const Divider(height: 32),
          _sec(l10n.stringSection),
          TextField(controller: _strCtrl, decoration: InputDecoration(labelText: l10n.labelInputString)),
          const SizedBox(height: 8),
          FilledButton(onPressed: _doUpper, child: Text(l10n.buttonToUpper)),
          Text(l10n.resultToUpper(_strRes), style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _sec(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(t, style: Theme.of(context).textTheme.titleSmall),
  );
}
