import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:leadx/firebase_options.dart';
import 'package:leadx/login/auth/signin.dart';
import 'package:leadx/screens/landingpage.dart';
import 'package:leadx/screens/home.dart';
import 'package:leadx/services/notificationservice.dart';
import 'package:leadx/subscription/subscriptionplanspage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Noti.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();

  runApp(MyApp(isLoggedIn: await isUserLogginedIn()));
}

Future<bool> isUserLogginedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  print("token : $token");
  return (token != null);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Leadesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      //home: PaymentPlansPage(afterotpval: true)
      home: isLoggedIn ? const Home() : SigninPage(),
      // home: const NotificationSettingScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check for existing authentication state
    if (FirebaseAuth.instance.currentUser != null) {
      return const Home();
    } else {
      // User not authenticated, navigate to the login screen
      return const LandingPage();
      // return const Home();
    }
  }
}
