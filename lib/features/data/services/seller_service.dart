import 'package:cloud_firestore/cloud_firestore.dart';

class SellerService {
  static Future<void> unblockAccount(
    String sellerId,
    Function(String? error) callback,
  ) async {
    try {
      Map<String, dynamic> sellerStatus = {"status": "approved"};

      await FirebaseFirestore.instance
          .collection("sellers")
          .doc(sellerId)
          .update(sellerStatus);
    } catch (e) {
      callback(e.toString());
    }
  }

  static Future<void> blockAccount(
    String sellerId,
    Function(String? error) callback,
  ) async {
    try {
      Map<String, dynamic> sellerStatus = {"status": "blocked"};

      await FirebaseFirestore.instance
          .collection("sellers")
          .doc(sellerId)
          .update(sellerStatus);
    } catch (e) {
      callback(e.toString());
    }
  }
}
