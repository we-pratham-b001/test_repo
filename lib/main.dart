import 'package:advicer/application/core/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/pages/advice_page/advice_page.dart';
import 'injection.dart'as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
