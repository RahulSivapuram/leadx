import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:leadx/screens/AboutScreen.dart';
import 'package:leadx/screens/FAQScreen.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:leadx/screens/auth/auth_controller.dart';
import 'package:leadx/screens/keywords.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/savedmessages.dart';
import 'package:leadx/services/notificationservice.dart';
import 'package:leadx/subscription/subscriptionfinishedpage.dart';
import 'package:leadx/screens/privacy_policy.dart';
import 'package:leadx/screens/profile.dart';
import 'package:leadx/screens/termsAndConditions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

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
    bool ans =
        Noti.shouldSuppressNotification(vm.userstarttime, vm.userstarttime);
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
            ElevatedButton(
                onPressed: () {
                  if (ans) {
                    Noti.noshowBigTextNotification(
                        title: "Sample",
                        body: "IT IS WORKING",
                        s: vm.userstarttime,
                        e: vm.userendtime);
                  } else {
                    vm.soundSelected
                        ? Noti.showBigTextNotification(
                            title: "sample", body: "it is working")
                        : Noti.vibshowBigTextNotification(
                            title: "sample", body: "It is working");
                  }
                },
                child: Text("press me")),
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
      // body: TextButton(
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const NoInternet()));
      //     },
      //     child: Center(child: Text("No Internet Screen"))),
    );
  }
}

Widget? draw(BuildContext context, phonenumber) {
  Authcontroller authcontroller = Get.put(Authcontroller());
  return Drawer(
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const ListTile(
            title: Text(
              'Rahul',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          ListTile(
            title: Text(
              Constants().number1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('All Messages'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Home()));
            },
          ),
          ListTile(
            title: const Text('Saved Messages'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SavedMessages()));
            },
          ),
          ListTile(
            title: const Text('Keywords'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => KeywordPage(
                        number: phonenumber,
                      )));
            },
          ),
          ListTile(
            title: const Text('Subscription Plans'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const SubscriptionFinished()));
            },
          ),
          ListTile(
            title: const Text('Notification Settings'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AboutScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('FAQs'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const FAQScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Terms And Conditions'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TermsAndConditionsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PrivacyPolicyPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              authcontroller.singin();
            },
          ),
          ListTile(
            title: const Text('Log out'),
            onTap: () async {
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
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.clear();
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
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text('Version : 1.7.10'),
          ),
        ],
      ),
    ),
  );
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



