import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/login/nameinput.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 135, left: 62, right: 51),
            child: Image.asset(
              "lib/images/Illustration.jpg",
              width: 262,
              height: 271,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 42, left: 47, right: 48),
            child: Container(
              width: 280,
              child: Text(
                "Never miss a sales opportunity on WhatsApp ever again",
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 18, left: 24, right: 24, bottom: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => InputName()),
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
                    "Register",
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
