import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:leadx/screens/AboutScreen.dart';
import 'package:leadx/screens/FAQScreen.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:leadx/screens/keywords.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/savedmessages.dart';
import 'package:leadx/subscription/subscriptionfinishedpage.dart';
import 'package:leadx/screens/privacy_policy.dart';
import 'package:leadx/screens/profile.dart';
import 'package:leadx/screens/termsAndConditions.dart';
import 'package:leadx/screens/notification_setting_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime.now();
  HomeController vm = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat('MMMM').format(now);
    String indianTime = DateFormat('h:mm a').format(now);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Messages'),
      ),
      drawer: Constants().draw(context, Constants().number1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: MessageCard(
                username: "Rahul",
                phonenumber: "7036XXXXXX",
                groupname: "Neonflake",
                information:
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                now: now,
                monthname: monthName,
                IndianTime: indianTime,
                ontapfunc: () {
                  vm.SavedMessages.add([
                    "Rahul",
                    "7036XXXXXX",
                    "Neonflake",
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                    now,
                    monthName,
                    indianTime,
                  ]);
                  vm.update();
                  print("added");
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Saved'),
                  ));
                },
                nosaved: false,
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: MessageCard(
                username: "Rahul",
                phonenumber: "7036XXXXXX",
                groupname: "Neonflake",
                information:
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                now: now,
                monthname: monthName,
                IndianTime: indianTime,
                ontapfunc: () {
                  vm.SavedMessages.add([
                    "Rahul",
                    "7036XXXXXX",
                    "Neonflake",
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                    now,
                    monthName,
                    indianTime,
                  ]);
                  vm.update();
                  print("added");
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Saved'),
                  ));
                },
                nosaved: false,
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: MessageCard(
                username: "Rahul",
                phonenumber: "7036XXXXXX",
                groupname: "Neonflake",
                information:
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                now: now,
                monthname: monthName,
                IndianTime: indianTime,
                ontapfunc: () {
                  vm.SavedMessages.add([
                    "Rahul",
                    "7036XXXXXX",
                    "Neonflake",
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                    now,
                    monthName,
                    indianTime,
                  ]);
                  vm.update();
                  print(vm.SavedMessages);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Saved'),
                  ));
                },
                nosaved: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*
Widget? messagecard(
    BuildContext context,
    String username,
    String phonenumber,
    String groupname,
    String information,
    DateTime now,
    String monthname,
    String IndianTime,
    VoidCallback ontapfunc,
    bool nosaved) {
  return Container(
    padding: const EdgeInsets.only(
      left: 10,
      right: 10,
      top: 1,
    ),
    width: MediaQuery.of(context).size.width / 1,
    // height: MediaQuery.of(context).size.height / 2.5,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
        ),
        Text(
          phonenumber,
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
        ),
        Text(
          groupname,
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          information,
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
              '${now.day} $monthname ${now.year} $IndianTime',
              style: GoogleFonts.mulish(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            nosaved
                ? Text("")
                : IconButton(
                    onPressed: ontapfunc,
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
}*/



