import 'package:flutter/material.dart';

class SelectedDrawerButton extends ChangeNotifier {
  int _selectedDrawer = 0;
  int get selectedDrawer => _selectedDrawer;

  selectDrawer(int index) {
    _selectedDrawer = index;
    notifyListeners();
  }
}

class SelectedProfileButton extends ChangeNotifier {
  int _selectedProfile = 0;
  int get selectedProfile => _selectedProfile;

  void selectProfile(int index) {
    _selectedProfile = index;
    notifyListeners();
  }
}
