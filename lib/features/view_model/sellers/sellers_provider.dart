import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/seller.dart';

class SellerProvider extends ChangeNotifier {
  List<Seller> _verifiedSellers = [];
  List<Seller> _blockedSellers = [];
  int _sellersCount = 0;
  bool _isLoading = false;

  List<Seller> get verifiedSellers => _verifiedSellers;
  List<Seller> get blockedSellers => _blockedSellers;
  int get sellersCount => _sellersCount;
  bool get isLoading => _isLoading;

  Future<void> fetchAllSellers(Function(String? error) callback) async {
    try {
      _isLoading = true;

      QuerySnapshot verifiedSnapshot = await FirebaseFirestore.instance
          .collection('sellers')
          .where('status', isEqualTo: 'approved')
          .get();

      QuerySnapshot blockedSnapshot = await FirebaseFirestore.instance
          .collection('sellers')
          .where('status', isEqualTo: 'blocked')
          .get();

      _verifiedSellers = verifiedSnapshot.docs.map((doc) {
        return Seller.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      _blockedSellers = blockedSnapshot.docs.map((doc) {
        return Seller.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      _sellersCount = _verifiedSellers.length + _blockedSellers.length;

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      callback(error.toString());
    }
  }
}
