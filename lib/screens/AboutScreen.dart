import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/home.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Leadesh",
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
        ),
      ),
      drawer: draw(context, Constants().number1),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 1.5,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Text(
                "We understand the value of not missing important conversations, especially when it comes to potential sales opportunities.Our app lets you choose specific words you care about, and we'll alert you when these words come up in your WhatsApp conversations. It's that simple. No frills, just a straightforward way to ensure you stay in the loop and never miss out on what matters most to you.We believe in making technology work for you, effortlessly. Leadesh is here to keep you connected and engaged, without the hassle. Try it out and see how staying informed can be as easy as a few taps on your phone.",
                style: GoogleFonts.mulish(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
