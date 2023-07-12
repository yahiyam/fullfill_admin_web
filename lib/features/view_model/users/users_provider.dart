import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _verifiedUsers = [];
  final List<User> _blockedUsers = [];

  List<User> get verifiedUsers => _verifiedUsers;
  List<User> get blockedUsers => _blockedUsers;

  Future<void> fetchAllUsers(Function(String? error) callback) async {
    try {
      QuerySnapshot verifiedSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('status', isEqualTo: 'approved')
          .get();

      QuerySnapshot blockedSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('status', isEqualTo: 'blocked')
          .get();

      for (QueryDocumentSnapshot doc in verifiedSnapshot.docs) {
        User user = User.fromJson(doc.data() as Map<String, dynamic>);
        verifiedUsers.add(user);
      }

      for (QueryDocumentSnapshot doc in blockedSnapshot.docs) {
        User user = User.fromJson(doc.data() as Map<String, dynamic>);
        blockedUsers.add(user);
      }

      notifyListeners();
    } catch (e) {
      callback(e.toString());
    }
  }
}
