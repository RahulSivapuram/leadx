import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/screens/home.dart';

class VerifyOtp extends StatefulWidget {
  final String number;
  const VerifyOtp({super.key, required this.number});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool box2 = false;
  bool box3 = false;
  bool box4 = false;
  bool box1 = true;
  bool box5 = false;
  bool box6 = false;
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
                "Enter the code we've sent to +91 ${widget.number}",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 63, right: 64, top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  box1
                      ? Container(
                          width: 32,
                          height: 40,
                          child: TextFormField(
                            //decoration: InputDecoration(border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() {
                                  box2 = true;
                                });
                              }
                            },
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      : circle(),
                  box2
                      ? Container(
                          width: 32,
                          height: 40,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              setState(() {
                                box3 = true;
                              });
                            },
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      : circle(),
                  box3
                      ? Container(
                          width: 32,
                          height: 40,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              setState(() {
                                box4 = true;
                              });
                            },
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      : circle(),
                  box4
                      ? Container(
                          width: 32,
                          height: 40,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() {
                                  box5 = true;
                                });
                              }
                            },
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      : circle(),
                  box5
                      ? Container(
                          width: 32,
                          height: 40,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                                setState(() {
                                  box6 = true;
                                });
                              }
                            },
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      : circle(),
                  box6
                      ? Container(
                          width: 32,
                          height: 40,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      : circle(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 66),
              child: Text(
                "Didn't receive code? Send Again",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF002DE3)),
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => Home(
                              phonenumber: widget.number,
                            )),
                  );
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

class circle extends StatelessWidget {
  const circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xFFEDEDED)),
    );
  }
}
