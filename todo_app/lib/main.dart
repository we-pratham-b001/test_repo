import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        GlobalMaterialLocalizations.delegate,
      ],
      title: 'todo app',
      themeMode: ThemeMode.system,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      routerConfig: routes,
    );
  }
}
