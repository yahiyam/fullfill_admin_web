import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAuthService {
  static Future<void> loginWithEmail(
    String email,
    String password,
    Function(String? error) callback,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? currentUser = userCredential.user;
      if (currentUser != null) {
        DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
            .collection("admins")
            .doc(currentUser.uid)
            .get();

        if (adminSnapshot.exists) {
          callback(null);
        } else {
          callback("No record found. You are not an admin.");
        }
      } else {
        callback("Failed to sign in. Please check your credentials.");
      }
    } catch (error) {
      callback(error.toString());
    }
  }
}
