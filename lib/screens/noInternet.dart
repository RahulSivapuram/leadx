import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          const Center(child: Text("We can't reach to the internet")),
          const SizedBox(
            height: 40,
          ),
          Image.asset("lib/images/noInternet.png"),
          const SizedBox(
            height: 50,
          ),
          const Text(
              "Seems like you're offline. Please \n check your internet connection"),
          const SizedBox(
            height: 40,
          ),
          TextButton(onPressed: () {}, child: const Text("Try Again"))
        ],
      ),
    );
  }
}
