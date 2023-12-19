import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<List<dynamic>> SavedMessages = [];
  String finalselectedplan = "";
  bool soundSelected = true;
  bool vibrationSelected = true;
  bool quietHour = false;
  TimeOfDay userstarttime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay userendtime = const TimeOfDay(hour: 0, minute: 0);
}
