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
//
//
//
//
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode? themeMode;
  getInitialThemeMode()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    if(sharedPreferences.getString("themeMode")=="dark"){
      themeMode=ThemeMode.dark;
    }else if(sharedPreferences.getString("themeMode")=="light"){
      themeMode=ThemeMode.light;
    }else{
      themeMode=ThemeMode.system;
    }
    notifyListeners();
  }
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
  //   setThemeMode(bool isOn) async {
  //   final prefs= await SharedPreferences.getInstance();
  //   if (isOn) {
  //     themeMode = ThemeMode.dark;
  //     prefs.setString('themeMode', "ThemeMode.dark");
  //   } else {
  //     themeMode = ThemeMode.light;
  //     prefs.setString('themeMode', "ThemeMode.light");
  //   }
  //   notifyListeners();
  // }
  // ThemeMode get getThemeMode=>themeMode!;



  // void setThemeModeS(ThemeMode themeMode)async{
  //   final prefs= await SharedPreferences.getInstance();
  //
  //   prefs.setString("themeMode", themeMode.toShortString());
  // }

  setThemeMode(ThemeMode _themeMode) async {
    final prefs= await SharedPreferences.getInstance();
    if (_themeMode==ThemeMode.dark) {
      themeMode = _themeMode;
      prefs.setString('themeMode', _themeMode.toShortString());
    }else if(_themeMode==ThemeMode.light){
      themeMode = _themeMode;
      prefs.setString('themeMode', _themeMode.toShortString());
    }
    else {
      themeMode = _themeMode;
      prefs.setString('themeMode', _themeMode.toShortString());
    }
    notifyListeners();
  }

}
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class ThemeProvider extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.system;
//   SharedPreferences prefs= await SharedPreferences.getInstance();
//
//   Future<bool> get isDarkMode async {
//
//     if (themeMode == ThemeMode.dark) {
//       prefs.setBool('isDarkMode', true);
//       return true;
//     } else if (themeMode == ThemeMode.system) {
//       var brightness = SchedulerBinding.instance.platformDispatcher
//           .platformBrightness;
//       if (brightness == Brightness.dark) {
//         prefs.setBool('isDarkMode', true);
//         return true;
//       } else {
//         prefs.setBool('isDarkMode', false);
//         return false;
//       }
//     }
//     else {
//       prefs.setBool('isDarkMode', false);
//       return false;
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ThemeProvider extends ChangeNotifier{
//   final String key='theme';
//   late SharedPreferences _prefs;
//   late bool _isDarkTheme;
//
//   bool get darkTheme=>_isDarkTheme;
//
//   ThemeNotifier(){
//     _isDarkTheme=true;
//     _loadFromPrefs();
//   }
//   toggleTheme(){
//     _isDarkTheme = !_isDarkTheme;
//     _saveToPrefs();
//   }
//   _initPrefs() async {
//     if(_prefs == null){
//       _prefs=await SharedPreferences.getInstance();
//       _loadFromPrefs();
//     }
//   }
//
//   _loadFromPrefs() async {
//     await _initPrefs();
//     _isDarkTheme=_prefs.getBool(key) ?? true;
//     notifyListeners();
//   }
//   _saveToPrefs() async {
//     await _initPrefs();
//     _prefs.setBool(key, _isDarkTheme);
//   }
// }

// enum Day { monday, tuesday }
//
// extension ParseToString on Day {
//   String toShortString() {
//   return this.toString().split('.').last;
//   }
// }
//
// mainTest() {
//   Day monday = Day.monday;
//   print(monday.toShortString()); //prints 'monday'
// }


// extension ParseToString on ThemeMode {
//   String toShortString() {
//     return this.toString().split('.').last;
//   }
// }