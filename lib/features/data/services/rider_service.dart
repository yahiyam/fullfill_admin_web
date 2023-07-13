import 'package:cloud_firestore/cloud_firestore.dart';

class RiderService {
  static Future<void> unblockAccount(
    String riderId,
    Function(String? error) callback,
  ) async {
    try {
      Map<String, dynamic> riderStatus = {"status": "approved"};

      await FirebaseFirestore.instance
          .collection("riders")
          .doc(riderId)
          .update(riderStatus);
    } catch (e) {
      callback(e.toString());
    }
  }

  static Future<void> blockAccount(
    String riderId,
    Function(String? error) callback,
  ) async {
    try {
      Map<String, dynamic> riderStatus = {"status": "blocked"};

      await FirebaseFirestore.instance
          .collection("riders")
          .doc(riderId)
          .update(riderStatus);
    } catch (e) {
      callback(e.toString());
    }
  }
}
