import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/screens/otpverify.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  late String number1 = "";
  final TextEditingController _phonecontroller = TextEditingController();
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
                "What's your mobile number?",
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
              child: Row(
                children: [
                  Container(
                    width: 74,
                    height: 36,
                    color: const Color(0xFFF7F7FC),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            "lib/images/India-Flag-icon.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          height: 24,
                          child: Text(
                            "+91",
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFADB5BD)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 16, top: 14),
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: 36,
                    color: Color(0xFFF7F7FC),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _phonecontroller,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.mulish(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFFADB5BD)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 81),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    number1 = _phonecontroller.text.toString();
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => VerifyOtp(
                              number: number1,
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
      ),
    );
  }
}
