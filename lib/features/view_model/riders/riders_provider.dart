import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';

class RiderProvider extends ChangeNotifier {
  final List<Rider> _verifiedRiders = [];
  final List<Rider> _blockedRiders = [];

  List<Rider> get verifiedRiders => _verifiedRiders;
  List<Rider> get blockedRiders => _blockedRiders;

  Future<void> fetchAllRiders(Function(String? error) callback) async {
    try {
      QuerySnapshot verifiedSnapshot = await FirebaseFirestore.instance
          .collection('riders')
          .where('status', isEqualTo: 'approved')
          .get();

      QuerySnapshot blockedSnapshot = await FirebaseFirestore.instance
          .collection('riders')
          .where('status', isEqualTo: 'blocked')
          .get();

      for (QueryDocumentSnapshot doc in verifiedSnapshot.docs) {
        Rider rider = Rider.fromJson(doc.data() as Map<String, dynamic>);
        verifiedRiders.add(rider);
      }

      for (QueryDocumentSnapshot doc in blockedSnapshot.docs) {
        Rider rider = Rider.fromJson(doc.data() as Map<String, dynamic>);
        blockedRiders.add(rider);
      }

      notifyListeners();
    } catch (e) {
      callback(e.toString());
    }
  }
}
