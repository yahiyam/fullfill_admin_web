import 'dart:async';

import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  String _currentTimeString = '';
  String get currentTimeString => _currentTimeString.toString();

  String _currentDateString = '';
  String get currentDateString => _currentDateString.toString();

  DateTimeProvider() {
    Timer.periodic(
      const Duration(seconds: 1),
      (_) => updateDateTime(),
    );
  }

  void updateDateTime() {
    final now = DateTime.now();
    final hour = now.hour;
    final minute = now.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;

    final formattedHourString = formattedHour.toString().padLeft(2, '0');
    final minuteString = minute.toString().padLeft(2, '0');

    _currentTimeString = '$formattedHourString:$minuteString $period';
    _currentDateString = '${now.day}/${now.month}/${now.year}';
    notifyListeners();
  }
}
