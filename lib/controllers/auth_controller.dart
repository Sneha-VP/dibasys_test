import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();

  bool rememberMe = false;

  void toggleRemember(bool? value) {
    rememberMe = value ?? false;
    notifyListeners();
  }

  bool login(String phone, String passcode) {
    // Dummy validation
    return phone.isNotEmpty && passcode.isNotEmpty;
  }
}
