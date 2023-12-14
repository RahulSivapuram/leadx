import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/subscription/subscriptionplanspage.dart';

class SubscriptionFinished extends StatelessWidget {
  const SubscriptionFinished({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            child: Text(
              "Your 7-day trial has ended. To continue enjoying Leadesh, please choose a plan and make a payment.",
              style: GoogleFonts.mulish(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "Selected Plan : ${Constants().slctplan}",
            style: GoogleFonts.mulish(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          Text(
            "Number of Keywords : ${Constants().nk}",
            style: GoogleFonts.mulish(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          Text(
            "Cost : \$${Constants().cost}",
            style: GoogleFonts.mulish(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: Text(
              "Upgrade/Downgrade Options:",
              style: GoogleFonts.mulish(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.black, width: 1)),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width / 1,
              // height: MediaQuery.of(context).size.height / 2.5,
              child: Text(
                "Upgrade to Pro Plan",
                style: GoogleFonts.mulish(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
          ),
          Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.black, width: 1)),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width / 1,
              // height: MediaQuery.of(context).size.height / 2.5,
              child: Text(
                "Downgrade to Basic Plan",
                style: GoogleFonts.mulish(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: button(
                Colors.black,
                "Pay Now",
                MediaQuery.of(context).size.height / 14,
                Colors.white,
                MediaQuery.of(context).size.width / 2,
                25),
          )
        ],
      ),
    );
  }
}
