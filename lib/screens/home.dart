import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leadx/screens/AboutScreen.dart';
import 'package:leadx/screens/FAQScreen.dart';
import 'package:leadx/screens/constants.dart';
import 'package:leadx/screens/keywords.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/paymentplanspage.dart';

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
            title: Text('Messages'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Home()));
            },
          ),
          ListTile(
            title: Text('Keywords'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => KeywordPage(
                        number: phonenumber,
                      )));
            },
          ),
          ListTile(
            title: Text('Subscription Plans'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const PaymentPlansPage(
                        afterotpval: false,
                      )));
            },
          ),
          ListTile(
            title: Text('Notification Settings'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => AboutScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => FAQScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Terms And Conditions'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Log out'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => LandingPage(),
                ),
              );
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
