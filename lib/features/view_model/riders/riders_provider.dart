import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';

class RiderProvider extends ChangeNotifier {
  List<Rider> _verifiedRiders = [];
  List<Rider> _blockedRiders = [];
  int _ridersCount = 0;
  bool _isLoading = false;

  List<Rider> get verifiedRiders => _verifiedRiders;
  List<Rider> get blockedRiders => _blockedRiders;
  int get ridersCount => _ridersCount;
  bool get isLoading => _isLoading;

  Future<void> fetchAllRiders(Function(String? error) callback) async {
    try {
      _isLoading = true;

      QuerySnapshot verifiedSnapshot = await FirebaseFirestore.instance
          .collection('riders')
          .where('status', isEqualTo: 'approved')
          .get();

      QuerySnapshot blockedSnapshot = await FirebaseFirestore.instance
          .collection('riders')
          .where('status', isEqualTo: 'blocked')
          .get();

      _verifiedRiders = verifiedSnapshot.docs.map((doc) {
        return Rider.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      _blockedRiders = blockedSnapshot.docs.map((doc) {
        return Rider.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      _ridersCount = _verifiedRiders.length + _blockedRiders.length;

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      callback(error.toString());
    }
  }
}
