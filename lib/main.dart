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
  String _version = '-';
  String _rawInfo = '-';
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    try {
      _version = native.version;
      _rawInfo = native.platformInfo;
    } catch (_) {
      _version = '(error)';
      _rawInfo = '(error)';
    }
  }

  void _refresh() => setState(() => _load());

  void _switchLocale() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('zh')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final p = _rawInfo.split('|');
    final os = p.isNotEmpty ? p[0] : '-';
    final arch = p.length > 1 ? p[1] : '-';
    final compiler = p.length > 2 ? p[2] : '-';
    final osVer = p.length > 3 ? p[3] : '-';

    return MaterialApp(
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(l10n.appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: _switchLocale,
              tooltip: l10n.buttonSwitchLang,
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l10n.nativeVersion(_version), style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text('C compiled via hook/build.dart (package_ffi)', style: theme.textTheme.bodySmall),
              ]),
            )),
            const SizedBox(height: 16),
            Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l10n.platformInfoTitle, style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                _row(l10n.labelOS, os),
                const SizedBox(height: 8),
                _row(l10n.labelArch, arch),
                const SizedBox(height: 8),
                _row(l10n.labelCompiler, compiler),
                const SizedBox(height: 8),
                _row(l10n.labelOSVersion, osVer),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _refresh,
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.buttonRefresh),
                ),
              ]),
            )),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) => Row(children: [
    SizedBox(width: 120, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600))),
    Expanded(child: Text(value)),
  ]);
}
