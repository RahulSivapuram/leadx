import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/login/otpverify.dart';
import 'package:leadx/login/auth/auth_controller.dart';
import 'package:leadx/screens/home.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  Authcontroller vm = Get.isRegistered<Authcontroller>()
      ? Get.find<Authcontroller>()
      : Get.put(Authcontroller());
  final TextEditingController _phonecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phonecontroller.text = "9369066500";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<Authcontroller>(builder: (vm) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          weight: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 79, left: 40, right: 40),
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
                          setState(() {
                            _countryCode = countryCode;
                          });
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
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 74,
                  //       height: 36,
                  //       color: const Color(0xFFF7F7FC),
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             height: 24,
                  //             width: 24,
                  //             child: Image.asset(
                  //               "lib/images/India-Flag-icon.png",
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 8,
                  //           ),
                  //           SizedBox(
                  //             height: 24,
                  //             child: Text(
                  //               "+91",
                  //               style: GoogleFonts.mulish(
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 16,
                  //                   color: const Color(0xFFADB5BD)),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(width: 8),
                  //     Container(
                  //       padding:
                  //       const EdgeInsets.only(left: 8, right: 16, top: 14),
                  //       width: MediaQuery.of(context).size.width / 1.4,
                  //       height: 36,
                  //       color: const Color(0xFFF7F7FC),
                  //       child:
                  //           TextField(
                  //             keyboardType: TextInputType.text,
                  //             controller: _phonecontroller,
                  //             decoration: InputDecoration(
                  //               hintText: "Phone Number",
                  //               border: InputBorder.none,
                  //               hintStyle: GoogleFonts.mulish(
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 16,
                  //                   color: const Color(0xFFADB5BD)),
                  //             ),
                  //           ),
                  //     ),
                  //   ],
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 81),
                  child: GestureDetector(
                    onTap: () async {
                      vm.mobileNumber.value = _phonecontroller.text.trim();
                      setState(() {
                        Constants().number1 = _phonecontroller.text.toString();
                      });
                      await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted:
                              (PhoneAuthCredential credentail) {},
                          codeSent: (String verificationid, int? resendtoken) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyOtp(
                                  verificationId: verificationid,
                                ),
                              ),
                            );
                          },
                          verificationFailed: (FirebaseAuthException ex) {},
                          codeAutoRetrievalTimeout: (String verificationId) {},
                          phoneNumber:
                              "${_countryCode.dialCode}${vm.mobileNumber.value}");
                    },
                    child: Container(
                      width: 327,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFF002DE3),
                      ),
                      child: Center(
                        child: Text(
                          "Send Code",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
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
