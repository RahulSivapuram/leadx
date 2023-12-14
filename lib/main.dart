import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:leadx/firebase_options.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/notification_setting_screen.dart';
import 'package:leadx/screens/home.dart';
import 'package:leadx/screens/keywords.dart';
import 'package:leadx/screens/landingpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chateo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LandingPage(),
      // home: const NotificationSettingScreen(),
    );
  }
}
