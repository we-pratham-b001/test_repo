import 'package:advicer/application/core/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/pages/advice_page/advice_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeService(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeService.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: AdvicePageBlocProvider(),
        );
      },
    );
  }
}
