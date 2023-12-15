import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:leadx/subscription/subscriptionplanspage.dart';

import '../screens/home.dart';

class SubscriptionFinished extends StatefulWidget {
  const SubscriptionFinished({super.key});

  @override
  State<SubscriptionFinished> createState() => _SubscriptionFinishedState();
}

class _SubscriptionFinishedState extends State<SubscriptionFinished> {
  HomeController vm = Get.put(HomeController());
  bool slctplan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscription Plans",
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Constants().draw(context, Constants().number1),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            child: Text(
              "Your 7-day trial has ended. To continue enjoying Leadesh, please choose a plan and make a payment.",
              style: GoogleFonts.mulish(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
          vm.finalselectedplan == "Basic Plan"
              ? GestureDetector(
                  onTap: () {},
                  child: Subscriptionfinishedcard1(
                      context,
                      const Color(0xFF002De3),
                      Colors.white,
                      ": Basic",
                      "100",
                      10,
                      false,
                      "Selected Plan"),
                )
              : GestureDetector(
                  onTap: () {},
                  child: Subscriptionfinishedcard1(
                      context,
                      const Color(0xFF002De3),
                      Colors.white,
                      ": Pro",
                      "200",
                      25,
                      false,
                      "Selected Plan"),
                ),

          //upgradation or degradation
          vm.finalselectedplan == "Basic Plan"
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      slctplan = !slctplan;
                    });
                  },
                  child: Subscriptionfinishedcard1(
                      context,
                      Colors.white,
                      const Color(0xFF002De3),
                      "Pro",
                      "200",
                      25,
                      slctplan,
                      "Upgrade to"),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      slctplan = !slctplan;
                    });
                  },
                  child: Subscriptionfinishedcard1(
                      context,
                      Colors.white,
                      const Color(0xFF002De3),
                      "Basic",
                      "100",
                      10,
                      slctplan,
                      "Downgrade to"),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          GestureDetector(
              onTap: () {},
              child: button(Colors.green, "Pay now", 60, Colors.white, 300, 20))
        ],
      ),
    );
  }
}

Widget? Subscriptionfinishedcard1(
    BuildContext context,
    Color backcolor,
    Color textcolor,
    String title,
    String price,
    int nk,
    bool proselect,
    String initialplan) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side:
            BorderSide(color: proselect ? Colors.black : textcolor, width: 5)),
    color: backcolor,
    elevation: 5,
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width / 1,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Row(
              children: [
                Text(
                  "$initialplan ",
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Text(
                  title,
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 5),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/rupee-indian.png",
                  height: 20,
                  width: 20,
                  color: textcolor,
                ),
                Text(
                  price,
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
                Text(
                  " / per month",
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Text(
              "Monitor upto $nk keywords",
              style: GoogleFonts.mulish(
                  color: textcolor, fontSize: 20, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    ),
  );
}
