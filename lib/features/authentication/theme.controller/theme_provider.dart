// import 'package:flutter/material.dart';
// class ThemeProvider extends ChangeNotifier{
//   ThemeMode themeMode=ThemeMode.system;
//   bool get isDarkMode=>themeMode==ThemeMode.dark;
//
//   void toggleTheme(bool isOn){
//    themeMode=isOn?ThemeMode.dark : ThemeMode.light;
//    notifyListeners();
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.system;
  bool get isDarkMode {
    if(themeMode ==ThemeMode.dark){
      return true;
    }else if(themeMode ==ThemeMode.system){
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      if(brightness == Brightness.dark){
        return true;
      }else{
        return false;
      }
    }
    else{
      return false;
    }
  }

  void toggleTheme(bool isOn){
    themeMode=isOn?ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}