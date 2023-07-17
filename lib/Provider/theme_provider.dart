import 'package:exam_one/Model/theme_mode;.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class theme_provider extends ChangeNotifier {
  theme_model app_theme;

  theme_provider({required this.app_theme});

  Future<void> change_app_theme(bool n) async {
    app_theme.isDark = !app_theme.isDark;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('theme_value', app_theme.isDark);
    notifyListeners();
  }
}
