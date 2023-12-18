import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/login/nameinput.dart';
import 'package:leadx/screens/auth/auth_controller.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  Authcontroller vm = Get.isRegistered<Authcontroller>()
      ? Get.find<Authcontroller>()
      : Get.put(Authcontroller());
  final TextEditingController _phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<Authcontroller>(builder: (vm) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 49, left: 40, right: 40),
                  child: Text(
                    "What's your mobile number & Country Code?",
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 40, right: 40),
                  child: Text(
                    "We will send you a code to verify your number",
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phonecontroller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter your phone number',
                      prefixIcon: CountryCodePicker(
                        onChanged: (CountryCode countryCode) {
                          vm.countryCode = countryCode;
                          vm.update();
                        },
                        initialSelection: 'IN',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return 'Please enter valid phone number';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 81),
                  child: GestureDetector(
                    onTap: () async {
                      vm.mobileNumber.value = _phonecontroller.text.trim();
                      vm.singin();
                      // await FirebaseAuth.instance.verifyPhoneNumber(
                      //     verificationCompleted:
                      //         (PhoneAuthCredential credentail) {},
                      //     codeSent: (String verificationid, int? resendtoken) {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => VerifyOtp(
                      //             verificationId: verificationid,
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     verificationFailed: (FirebaseAuthException ex) {
                      //       Navigator.of(context).push(
                      //           MaterialPageRoute(builder: (_) => Home()));
                      //     },
                      //     codeAutoRetrievalTimeout: (String verificationId) {},
                      //     phoneNumber:
                      //         "${_countryCode.dialCode}${vm.mobileNumber.value}");
                    },
                    child: Container(
                      width: 327,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFF002DE3),
                      ),
                      child: Center(
                        child: vm.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Sign in",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Signup",
                        style: const TextStyle(
                            fontSize: 14, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const InputName()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
