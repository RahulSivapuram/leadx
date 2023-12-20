import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:leadx/services/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontroller extends GetxController {
  final AuthService _authService = AuthService();

  RxString mobileNumber = "".obs;
  RxString name = "".obs;
  CountryCode countryCode = CountryCode(code: 'IN', dialCode: '+91');
  bool isLoading = false;

  void singin() async {
    isLoading = true;
    update();
    if (mobileNumber.value.isEmpty) {
      mobileNumber.value = "9369066500";
    }
    final response = await _authService.signin(mobileNumber.value);
    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response["token"]);
    }
    isLoading = false;
    update();
    print("response of signin : $response");
  }

  void signup() async {
    final response = await _authService.signup({
      "mobile ": "${countryCode.dialCode}${mobileNumber.value}",
      "name": name.value,
    });
    print("response of signup : $response");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", response?["token"]);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
