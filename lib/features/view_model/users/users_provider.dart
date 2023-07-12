import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _verifiedUsers = [];
  List<User> _blockedUsers = [];
  int _usersCount = 0;
  bool _isLoading = false;

  List<User> get verifiedUsers => _verifiedUsers;
  List<User> get blockedUsers => _blockedUsers;
  int get usersCount => _usersCount;
  bool get isLoading => _isLoading;

  Future<void> fetchAllUsers(Function(String? error) callback) async {
    try {
      _isLoading = true;

      QuerySnapshot verifiedSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('status', isEqualTo: 'approved')
          .get();

      QuerySnapshot blockedSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('status', isEqualTo: 'blocked')
          .get();

      _verifiedUsers = verifiedSnapshot.docs.map((doc) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      _blockedUsers = blockedSnapshot.docs.map((doc) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      
      _usersCount = _verifiedUsers.length + _blockedUsers.length;

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      callback(error.toString());
    }
  }
}
