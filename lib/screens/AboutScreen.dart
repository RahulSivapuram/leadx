import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              "About Leadesh",
              style: GoogleFonts.mulish(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 400,
              width: 400,
              child: Text(
                "We understand the value of not missing important conversations, especially when it comes to potential sales opportunities.Our app lets you choose specific words you care about, and we'll alert you when these words come up in your WhatsApp conversations. It's that simple. No frills, just a straightforward way to ensure you stay in the loop and never miss out on what matters most to you.We believe in making technology work for you, effortlessly. Leadesh is here to keep you connected and engaged, without the hassle. Try it out and see how staying informed can be as easy as a few taps on your phone.",
                style: GoogleFonts.mulish(color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
