import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  Duration workingHours = Duration.zero;

  void manualCheckIn() {
    // For demo
    workingHours = const Duration(hours: 1);
    notifyListeners();
  }
}
