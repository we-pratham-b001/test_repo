import 'package:flutter/cupertino.dart';

class ThemeService with ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
