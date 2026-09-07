import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';
import 'src/ffi/native_bindings.dart' as native;

void main() {
  runApp(const FlutterNativeBaseApp());
}

class FlutterNativeBaseApp extends StatefulWidget {
  const FlutterNativeBaseApp({super.key});
  @override
  State<FlutterNativeBaseApp> createState() => _FlutterNativeBaseAppState();
}

class _FlutterNativeBaseAppState extends State<FlutterNativeBaseApp> {
  Locale _locale = const Locale('en');

  void _switchLocale() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('zh')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      title: 'Flutter Native Base',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(onSwitchLocale: _switchLocale),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF006B5E),
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0, scrolledUnderElevation: 1),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onSwitchLocale;
  const HomePage({super.key, required this.onSwitchLocale});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _version = '-';
  String _rawInfo = '-';

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

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final p = _rawInfo.split('|');
    final os = p.isNotEmpty ? p[0] : '-';
    final arch = p.length > 1 ? p[1] : '-';
    final compiler = p.length > 2 ? p[2] : '-';
    final osVer = p.length > 3 ? p[3] : '-';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.language, size: 20),
            onPressed: widget.onSwitchLocale,
            tooltip: l10n.buttonSwitchLang,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          // Header banner
          Card(
            color: cs.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(children: [
                Container(
                  width: 56, height: 56,
                  decoration: BoxDecoration(
                    color: cs.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.flutter_dash, color: cs.primaryContainer, size: 32),
                ),
                const SizedBox(width: 20),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('FlutterNativeBase', style: tt.titleLarge?.copyWith(
                      color: cs.onPrimaryContainer, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(l10n.nativeVersion(_version), style: tt.bodyMedium?.copyWith(
                      color: cs.onPrimaryContainer.withAlpha(204))),
                    Text('C compiled via hook/build.dart', style: tt.bodySmall?.copyWith(
                      color: cs.onPrimaryContainer.withAlpha(153))),
                  ],
                )),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          // Section title
          Text(l10n.platformInfoTitle, style: tt.titleSmall?.copyWith(
            color: cs.primary, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          // Info card
          Card(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(children: [
              _tile(Icons.computer, l10n.labelOS, os, cs, tt),
              const Divider(height: 24),
              _tile(Icons.memory, l10n.labelArch, arch, cs, tt),
              const Divider(height: 24),
              _tile(Icons.build_circle_outlined, l10n.labelCompiler, compiler, cs, tt),
              const Divider(height: 24),
              _tile(Icons.terminal, l10n.labelOSVersion, osVer, cs, tt),
            ]),
          )),
          const SizedBox(height: 24),
          // Refresh
          FilledButton.tonalIcon(
            onPressed: () => setState(() => _load()),
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(l10n.buttonRefresh),
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String label, String value, ColorScheme cs, TextTheme tt) {
    return Row(children: [
      Icon(icon, size: 20, color: cs.primary),
      const SizedBox(width: 12),
      SizedBox(width: 110, child: Text(label, style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant))),
      const SizedBox(width: 8),
      Expanded(child: Text(value, style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w500))),
    ]);
  }
}
