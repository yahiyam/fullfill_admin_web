import 'package:flutter/material.dart';

class SelectButton extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
