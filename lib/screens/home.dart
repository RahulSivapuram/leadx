import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leadx/screens/AboutScreen.dart';
import 'package:leadx/screens/FAQScreen.dart';
import 'package:leadx/screens/constants.dart';
import 'package:leadx/screens/keywords.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/paymentplanspage.dart';
import 'package:leadx/screens/privacy_policy.dart';
import 'package:leadx/screens/profile.dart';
import 'package:leadx/screens/termsAndConditions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Messages'),
        ),
        drawer: draw(context, Constants().number1));
  }
}

Widget? draw(BuildContext context, phonenumber) {
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
                fontSize: 25,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Messages'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Home()));
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
                  builder: (_) => const PaymentPlansPage(
                        afterotpval: false,
                      )));
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
