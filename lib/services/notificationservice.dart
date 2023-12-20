import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    print("Initializing notifications...");
    var androidInitialize = AndroidInitializationSettings('background');
    var initializationsSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      //sound: RawResourceAndroidNotificationSound('simple-notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(id, title, body, not);
  }

  static Future vibshowBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      vibrationPattern: Int64List.fromList([500]),
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(id, title, body, not);
  }

  //
  static Future noshowBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      TimeOfDay? s,
      TimeOfDay? e}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (shouldSuppressNotification(s!, e!)) {
      Get.snackbar(
        "Notification Service",
        "Notifications banned",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        colorText: Colors.white,
        borderRadius: 10.0,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOut,
        reverseAnimationCurve: Curves.easeIn,
      );
      print("Notification suppressed within the specified time range");
      return;
    }

    // Configure the notification
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      vibrationPattern: Int64List.fromList([500]),
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true, // Enable vibration
    );

    var not = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(id, title, body, not);
  }

  static bool shouldSuppressNotification(TimeOfDay s, TimeOfDay e) {
    // Check if the current time is within the specified time range (14:50 to 15:00)
    TimeOfDay startTime = s;
    TimeOfDay endTime = e;

    DateTime now = DateTime.now();
    DateTime startDateTime = DateTime(
        now.year, now.month, now.day, startTime.hour, startTime.minute);
    DateTime endDateTime =
        DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

    return now.isAfter(startDateTime) && now.isBefore(endDateTime);
  }
}


/*
void vibrateDevice() async {
  bool? hasVibrator = await Vibration.hasVibrator();

  if (hasVibrator != null && hasVibrator) {
    Vibration.vibrate(duration: 500);
  } else {
    print("Device does not support vibration.");
  }
}*/
