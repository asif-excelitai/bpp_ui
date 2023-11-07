import 'package:flutter/material.dart';

// class CheckBoxProvider with ChangeNotifier {
//   bool _isChecked = false;
//
//   bool get isChecked => _isChecked;
//
//   set isChecked(bool value) {
//     _isChecked = value;
//     notifyListeners();
//   }
//
//   void setBoolmode(bool value) {
//     _isChecked = value;
//     notifyListeners();
//   }
// }
class CheckBoxProvider with ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  bool setBoolmode(bool value) {
    _isChecked = value;
    notifyListeners();
    return _isChecked;
  }
}