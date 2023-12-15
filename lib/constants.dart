import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/screens/AboutScreen.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/notification_setting_screen.dart';

import 'screens/FAQScreen.dart';
import 'screens/home.dart';
import 'screens/keywords.dart';
import 'screens/privacy_policy.dart';
import 'screens/profile.dart';
import 'screens/savedmessages.dart';
import 'screens/termsAndConditions.dart';
import 'subscription/subscriptionfinishedpage.dart';

class Constants {
  DrawContent(String title, VoidCallback onpress) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 15),
      child: GestureDetector(onTap: onpress, child: Text(title)),
    );
  }

  String number1 = "";

  String slctplan = "Basic Plan";
  int nk = 10;
  int cost = 100;
  Map<int, List<String>> FAQuestions = {
    0: [
      "What is Leadesh?",
      "Leadesh is a mobile app designed for WhatsApp users. It helps you stay informed by alerting you when specific keywords appear in your WhatsApp conversations."
    ],
    1: [
      "How does Leadesh work?",
      "It's simple. Choose words you care about, and Leadesh will notify you when these words come up in your WhatsApp chats."
    ],
    2: [
      "Is Leadesh available for download on both iOS and Android?",
      "Leadesh is available for download on the Google Play Store for Android devices only."
    ],
    3: [
      "How much does Leadesh cost?",
      "We offer two packages - Rs 100 for 10 keywords and Rs 200 for 25 keywords. The first 7 days are free, and you don't need to provide any credit card details during the trial."
    ],
    4: [
      "Can I cancel my subscription at any time?",
      "Yes, you can cancel your subscription at any time. Leadesh believes in giving you the flexibility you need."
    ],
    5: [
      "Is my data secure with Leadesh?",
      "Absolutely. We take user privacy seriously. Your data is securely handled, and we don't compromise on your privacy."
    ],
    6: [
      "How do I get started with Leadesh?",
      "Simply download the app, sign up, and choose your keywords. Leadesh will start alerting you when those keywords appear in your WhatsApp conversations. It's that easy!"
    ]
  };
  //
  Widget? draw(BuildContext context, phonenumber) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                'Rahul',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "7036775939",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            const Divider(),
            DrawContent("All Messages", () {
              Get.to(Home());
            }),
            DrawContent("Saved Messages", () {
              Get.to(SavedMessages());
            }),
            DrawContent("Keywords", () {
              Get.to(KeywordPage(number: number1));
            }),
            DrawContent("Subscription Plan", () {
              Get.to(SubscriptionFinished());
            }),
            DrawContent("Notifications Settings", () {
              Get.to(NotificationSettingScreen());
            }),
            DrawContent("Profile", () {
              Get.to(ProfilePage());
            }),
            DrawContent("About", () {
              Get.to(AboutScreen());
            }),
            DrawContent("FAQs", () {
              Get.to(FAQScreen());
            }),
            DrawContent("Terms And Conditions", () {
              Get.to(TermsAndConditionsPage());
            }),
            DrawContent("Privacy Policy", () {
              Get.to(PrivacyPolicyPage());
            }),
            DrawContent("Log Out", () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red.shade300,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Are you sure you want to logout?',
                            style: TextStyle(fontSize: 5),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => const LandingPage(),
                                ),
                              );
                            },
                            child: const Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No')),
                      ],
                    );
                  });
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text('Version : 2.1.0'),
            ),
          ],
        ),
      ),
    );
  }

  //
  Widget? buttonh(String text) {
    return Container(
      width: 327,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xFF002DE3),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.mulish(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

class MessageCard extends StatefulWidget {
  final String username;
  final String phonenumber;
  final String groupname;
  final String information;
  final DateTime now;
  final String monthname;
  final String IndianTime;
  final VoidCallback ontapfunc;
  final bool nosaved;

  MessageCard({
    required this.username,
    required this.phonenumber,
    required this.groupname,
    required this.information,
    required this.now,
    required this.monthname,
    required this.IndianTime,
    required this.ontapfunc,
    required this.nosaved,
  });

  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 1,
      ),
      width: MediaQuery.of(context).size.width / 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.username,
            style: GoogleFonts.mulish(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Text(
            widget.phonenumber,
            style: GoogleFonts.mulish(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Text(
            widget.groupname,
            style: GoogleFonts.mulish(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            widget.information,
            style: GoogleFonts.mulish(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.now.day} ${widget.monthname} ${widget.now.year} ${widget.IndianTime}',
                style: GoogleFonts.mulish(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              widget.nosaved
                  ? Text("")
                  : IconButton(
                      onPressed: widget.ontapfunc,
                      icon: const Icon(
                        Icons.star_rate_sharp,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
