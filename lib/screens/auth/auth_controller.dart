import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadx/services/auth/auth_service.dart';

class Authcontroller extends GetxController {
  final AuthService _authService = AuthService();

  RxString mobileNumber = "".obs;
  RxString name = "".obs;

  void singin() async {
    final response = await _authService.signin(mobileNumber.value);
    print(response);
  }

  void signup() async {
    final response = await _authService.signup({
      "mobile ": mobileNumber.value,
      "name": name.value,
    });
    print(response);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
