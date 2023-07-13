import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  static Future<void> unblockAccount(
    String userId,
    Function(String? error) callback,
  ) async {
    try {
      Map<String, dynamic> userStatus = {"status": "approved"};

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .update(userStatus);
    } catch (e) {
      callback(e.toString());
    }
  }

  static Future<void> blockAccount(
    String userId,
    Function(String? error) callback,
  ) async {
    try {
      Map<String, dynamic> userStatus = {"status": "blocked"};

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .update(userStatus);
    } catch (e) {
      callback(e.toString());
    }
  }
}
