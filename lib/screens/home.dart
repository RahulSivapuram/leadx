import 'package:flutter/material.dart';
import 'package:leadx/screens/keywords.dart';
import 'package:leadx/screens/noInternet.dart';
import 'package:leadx/screens/notification_setting_screen.dart';

class Home extends StatefulWidget {
  final String phonenumber;
  const Home({super.key, required this.phonenumber});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const NotificationSettingScreen()));
              },
              icon: const Icon(Icons.notifications))
        ],
        title: const Text('Messages'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF002DE3),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rahul',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.phonenumber,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ])),
              ListTile(
                title: const Text('Keywords'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => KeywordPage(
                            number: widget.phonenumber,
                          )));
                },
              ),
              ListTile(
                title: const Text('Payment Plans'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Notifications'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Terms And Conditions'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                onTap: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5.1,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text('Version : 1.7.10'),
              ),
            ],
          ),
        ),
      ),
      body: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoInternet()));
          },
          child: Center(child: Text("No Internet Screen"))),
    );
  }
}
