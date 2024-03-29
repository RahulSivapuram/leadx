// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAztrd5mKpH2sO8JFUd8I8aZg8t6GmmlEY',
    appId: '1:422374059004:web:8a1654c1446747f2b2e079',
    messagingSenderId: '422374059004',
    projectId: 'leadesh',
    authDomain: 'leadesh.firebaseapp.com',
    storageBucket: 'leadesh.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCW0ZKo2ZYTUx6UcDijPrZka7AVibiS6lw',
    appId: '1:422374059004:android:322485d77d840b81b2e079',
    messagingSenderId: '422374059004',
    projectId: 'leadesh',
    storageBucket: 'leadesh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOR-8gVxUdRT1oRUMFDWs7u1cYBmhCo4U',
    appId: '1:422374059004:ios:90138b48a82c611fb2e079',
    messagingSenderId: '422374059004',
    projectId: 'leadesh',
    storageBucket: 'leadesh.appspot.com',
    iosBundleId: 'com.example.leadx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOR-8gVxUdRT1oRUMFDWs7u1cYBmhCo4U',
    appId: '1:422374059004:ios:5b94022e49ab9bbfb2e079',
    messagingSenderId: '422374059004',
    projectId: 'leadesh',
    storageBucket: 'leadesh.appspot.com',
    iosBundleId: 'com.example.leadx.RunnerTests',
  );
}
