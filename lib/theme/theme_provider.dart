import 'package:chat_app/theme/dark_model.dart';
import 'package:chat_app/theme/light_model.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  bool get isDartMode => _themeData == darkMode;

  void updateThemeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      updateThemeData(darkMode);
    }else{
      updateThemeData(lightMode);
    }
  }
}