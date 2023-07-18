import 'package:flutter/material.dart';

class SelectedDrawerButton extends ChangeNotifier {
  int _selectedDrawer = 0;
  int get selectedDrawer => _selectedDrawer;

  selectDrawer(int index) {
    _selectedDrawer = index;
    notifyListeners();
  }
}

class SelectedProfile extends ChangeNotifier {
  int _selectedVerifiedProfile = 0;
  int get selectedVerifiedProfile => _selectedVerifiedProfile;

  void selectVerifiedProfile(int index) {
    _selectedVerifiedProfile = index;
    notifyListeners();
  }

  void resetIndex() {
    _selectedBlockedProfile = 0;
    _selectedVerifiedProfile = 0;
  }

  int getSelectedProfile(bool isBlocked) {
    if (isBlocked) {
      return _selectedBlockedProfile;
    } else {
      return _selectedVerifiedProfile;
    }
  }

  int _selectedBlockedProfile = 0;
  int get selectedBlockedProfile => _selectedBlockedProfile;

  void selectBlockedProfile(int index) {
    _selectedBlockedProfile = index;
    notifyListeners();
  }
}
