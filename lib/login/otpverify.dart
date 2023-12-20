import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/login/auth/auth_controller.dart';
import 'package:leadx/subscription/subscriptionplanspage.dart';

import '../constants.dart';

// ignore: must_be_immutable
class VerifyOtp extends StatefulWidget {
  String verificationId;
  VerifyOtp({super.key, required this.verificationId});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

TextEditingController _otpController = TextEditingController();

class _VerifyOtpState extends State<VerifyOtp> {
  // bool box2 = false;
  // bool box3 = false;
  // bool box4 = false;
  // bool box1 = true;
  // bool box5 = false;
  // bool box6 = false;

  bool afterotpscreen = false;

  Authcontroller vm = Get.isRegistered<Authcontroller>()
      ? Get.find<Authcontroller>()
      : Get.put(Authcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                "What's the code?",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 40, right: 40),
              child: Text(
                "Enter the code we've sent \n to  ${Constants().number1}",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 63, right: 64, top: 48),
            //   child:
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     box1
            //         ? SizedBox(
            //             width: 32,
            //             height: 40,
            //             child: TextFormField(
            //               //decoration: InputDecoration(border: InputBorder.none),
            //               style: Theme.of(context).textTheme.titleLarge,
            //               keyboardType: TextInputType.number,
            //               onChanged: (val) {
            //                 if (val.length == 1) {
            //                   FocusScope.of(context).nextFocus();
            //                   setState(() {
            //                     box2 = true;
            //                   });
            //                 }
            //               },
            //               textAlign: TextAlign.center,
            //               inputFormatters: [
            //                 LengthLimitingTextInputFormatter(1),
            //                 FilteringTextInputFormatter.digitsOnly,
            //               ],
            //             ),
            //           )
            //         : const circle(),
            //     box2
            //         ? SizedBox(
            //             width: 32,
            //             height: 40,
            //             child: TextFormField(
            //               decoration:
            //                   const InputDecoration(border: InputBorder.none),
            //               style: Theme.of(context).textTheme.titleLarge,
            //               keyboardType: TextInputType.number,
            //               onChanged: (val) {
            //                 if (val.length == 1) {
            //                   FocusScope.of(context).nextFocus();
            //                 }
            //                 setState(() {
            //                   box3 = true;
            //                 });
            //               },
            //               textAlign: TextAlign.center,
            //               inputFormatters: [
            //                 LengthLimitingTextInputFormatter(1),
            //                 FilteringTextInputFormatter.digitsOnly,
            //               ],
            //             ),
            //           )
            //         : const circle(),
            //     box3
            //         ? SizedBox(
            //             width: 32,
            //             height: 40,
            //             child: TextFormField(
            //               decoration:
            //                   const InputDecoration(border: InputBorder.none),
            //               style: Theme.of(context).textTheme.titleLarge,
            //               keyboardType: TextInputType.number,
            //               onChanged: (val) {
            //                 if (val.length == 1) {
            //                   FocusScope.of(context).nextFocus();
            //                 }
            //                 setState(() {
            //                   box4 = true;
            //                 });
            //               },
            //               textAlign: TextAlign.center,
            //               inputFormatters: [
            //                 LengthLimitingTextInputFormatter(1),
            //                 FilteringTextInputFormatter.digitsOnly,
            //               ],
            //             ),
            //           )
            //         : const circle(),
            //     box4
            //         ? SizedBox(
            //             width: 32,
            //             height: 40,
            //             child: TextFormField(
            //               decoration:
            //                   const InputDecoration(border: InputBorder.none),
            //               style: Theme.of(context).textTheme.titleLarge,
            //               keyboardType: TextInputType.number,
            //               onChanged: (val) {
            //                 if (val.length == 1) {
            //                   FocusScope.of(context).nextFocus();
            //                   setState(() {
            //                     box5 = true;
            //                   });
            //                 }
            //               },
            //               textAlign: TextAlign.center,
            //               inputFormatters: [
            //                 LengthLimitingTextInputFormatter(1),
            //                 FilteringTextInputFormatter.digitsOnly,
            //               ],
            //             ),
            //           )
            //         : const circle(),
            //     box5
            //         ? SizedBox(
            //             width: 32,
            //             height: 40,
            //             child: TextFormField(
            //               decoration:
            //                   const InputDecoration(border: InputBorder.none),
            //               style: Theme.of(context).textTheme.titleLarge,
            //               keyboardType: TextInputType.number,
            //               onChanged: (val) {
            //                 if (val.length == 1) {
            //                   FocusScope.of(context).nextFocus();
            //                   setState(() {
            //                     box6 = true;
            //                   });
            //                 }
            //               },
            //               textAlign: TextAlign.center,
            //               inputFormatters: [
            //                 LengthLimitingTextInputFormatter(1),
            //                 FilteringTextInputFormatter.digitsOnly,
            //               ],
            //             ),
            //           )
            //         : const circle(),
            //     box6
            //         ? SizedBox(
            //             width: 32,
            //             height: 40,
            //             child: TextFormField(
            //               decoration:
            //                   const InputDecoration(border: InputBorder.none),
            //               style: Theme.of(context).textTheme.titleLarge,
            //               keyboardType: TextInputType.number,
            //               onChanged: (val) {
            //                 if (val.length == 1) {
            //                   FocusScope.of(context).nextFocus();
            //                 }
            //               },
            //               textAlign: TextAlign.center,
            //               inputFormatters: [
            //                 LengthLimitingTextInputFormatter(1),
            //                 FilteringTextInputFormatter.digitsOnly,
            //               ],
            //             ),
            //           )
            //         : const circle(),
            //   ],
            // ),
            // ),

            SizedBox(
              width: 250,
              height: 80,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _otpController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(10)),

                      borderSide: BorderSide(width: 1)),
                  hintText: 'Enter OTP',
                  prefixIcon: Icon(Icons.message),
                ),
                validator: (value) {
                  if (value!.length != 6) {
                    return 'Please enter valid OTP';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                onTap: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: _otpController.text.toString());
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      setState(() {
                        afterotpscreen = true;
                      });
                      vm.signup();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPlansPage(
                                    afterotpval: afterotpscreen,
                                  )));
                    });
                  } catch (ex) {
                    log(ex.toString() as num);
                  }
                },
                /*onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Home(),
                  ),
                ),*/
                child: Container(
                  width: 327,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF002DE3),
                  ),
                  child: Center(
                    child: Text(
                      "Save and Continue",
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
      ),
    );
  }
}

// ignore: camel_case_types
class circle extends StatelessWidget {
  const circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFEDEDED)),
    );
  }
}
