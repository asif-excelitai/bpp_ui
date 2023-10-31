

import 'dart:developer';

import 'package:ecshop/utils/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppThemeProvider with ChangeNotifier{

  bool isdarktheme=true;

  ThemeData getDefaultAppTheme(){
    log("=========>check pre isdarktheme = ${isdarktheme}<===========");
    log("=========>check pre isdarktheme = ${isdarktheme}<===========");
    final darkMode =  WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isdarktheme = darkMode == Brightness.dark;
    log("=========>check post isdarktheme = ${isdarktheme}<===========");
    log("=========>check post isdarktheme = ${isdarktheme}<===========");

    notifyListeners();
    if(isdarktheme){
      return SAppTheme.darktheme;
    }else{
      return SAppTheme.lighttheme;
    }
  }

  void setThemeMode(bool value){
    isdarktheme=value;
    notifyListeners();
  }
}