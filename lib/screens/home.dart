import 'package:flutter/material.dart';
import 'package:leadx/screens/keywords.dart';

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
                        Text(
                          'Rahul',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.phonenumber,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ])),
              ListTile(
                title: Text('Keywords'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => KeywordPage(
                            number: widget.phonenumber,
                          )));
                },
              ),
              ListTile(
                title: Text('Payment Plans'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Notifications'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: Text('About'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Terms And Conditions'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text('Version : 1.7.10'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
