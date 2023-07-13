import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';
import 'package:fullfill_admin_web_portal/features/data/services/rider_service.dart';

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

  Future<void> unblockRider(String riderId) async {
    try {
      await RiderService.unblockAccount(riderId, (error) {
        throw error ?? 'Error unblocking rider';
      });

      final index =
          _blockedRiders.indexWhere((rider) => rider.riderID == riderId);
      if (index != -1) {
        final rider = _blockedRiders.removeAt(index);
        _verifiedRiders.add(rider);
        _ridersCount++;
      }

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> blockRider(String userId) async {
    try {
      await RiderService.blockAccount(userId, (error) {
        throw error ?? 'Error blocking rider';
      });

      final index =
          _verifiedRiders.indexWhere((rider) => rider.riderID == userId);
      if (index != -1) {
        final rider = _verifiedRiders.removeAt(index);
        _blockedRiders.add(rider);
        _ridersCount--;
      }

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
