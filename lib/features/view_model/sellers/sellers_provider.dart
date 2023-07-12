import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/seller.dart';

class SellerProvider extends ChangeNotifier {
  final List<Seller> _verifiedSellers = [];
  final List<Seller> _blockedSellers = [];
  int _sellersCount = 0;

  List<Seller> get verifiedSellers => _verifiedSellers;
  List<Seller> get blockedSellers => _blockedSellers;
  int get sellersCount => _sellersCount;

  Future<void> fetchAllSellers(Function(String? error) callback) async {
    try {
      QuerySnapshot verifiedSnapshot = await FirebaseFirestore.instance
          .collection('sellers')
          .where('status', isEqualTo: 'approved')
          .get();

      QuerySnapshot blockedSnapshot = await FirebaseFirestore.instance
          .collection('sellers')
          .where('status', isEqualTo: 'blocked')
          .get();

      for (QueryDocumentSnapshot doc in verifiedSnapshot.docs) {
        Seller seller = Seller.fromJson(doc.data() as Map<String, dynamic>);
        verifiedSellers.add(seller);
      }

      for (QueryDocumentSnapshot doc in blockedSnapshot.docs) {
        Seller seller = Seller.fromJson(doc.data() as Map<String, dynamic>);
        blockedSellers.add(seller);
      }

      _sellersCount = verifiedSellers.length + blockedSellers.length;

      notifyListeners();
    } catch (e) {
      callback(e.toString());
    }
  }
}
