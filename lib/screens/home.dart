import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:leadx/services/notificationservice.dart';

import 'smscontroller.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime.now();
  HomeController vm = Get.put(HomeController());
  SMSController sms = Get.put(SMSController());
  bool containsAnyString(List<String> stringsToCheck, String targetString) {
    return stringsToCheck.any((element) => targetString.contains(element));
  }

  @override
  void initState() {
    super.initState();
    sms.requestForPermission();
  }

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat('MMMM').format(now);
    String indianTime = DateFormat('h:mm a').format(now);
    bool ans =
        Noti.shouldSuppressNotification(vm.userstarttime, vm.userstarttime);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('All Messages'),
        ),
        drawer: Constants().draw(context, Constants().number1),
        body: ListView(
          children: [
            Obx(
              () => Column(
                children: sms.notificationList.value
                    .map(
                      (e) => e.packageName!.contains("whatsapp") &&
                              containsAnyString(
                                  vm.keywords, e.content.toString())
                          ? Card(
                              color: Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: const BorderSide(
                                    color: Colors.black, width: 3),
                              ),
                              child: MessageCard(
                                username: "sample",
                                phonenumber: "9xxxxxxxxxxx",
                                groupname: e.title.toString(),
                                information: e.content.toString(),
                                now: now,
                                monthname: monthName,
                                IndianTime: indianTime,
                                ontapfunc: () {
                                  vm.SavedMessages.add([
                                    "sample",
                                    "9xxxxxxxxx",
                                    e.title.toString(),
                                    e.content.toString(),
                                    now,
                                    monthName,
                                    indianTime,
                                  ]);
                                  vm.update();
                                  print(vm.SavedMessages);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Saved'),
                                  ));
                                },
                                nosaved: false,
                              ),
                            )
                          : Text(""),
                    )
                    .toList(),
              ),
            )
          ],
        ));
  }
}


/*
Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: MessageCard(
                username: "Rahul",
                phonenumber: "7036XXXXXX",
                groupname: "Neonflake",
                information:
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                now: now,
                monthname: monthName,
                IndianTime: indianTime,
                ontapfunc: () {
                  vm.SavedMessages.add([
                    "Rahul",
                    "7036XXXXXX",
                    "Neonflake",
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                    now,
                    monthName,
                    indianTime,
                  ]);
                  vm.update();
                  print(vm.SavedMessages);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Saved'),
                  ));
                },
                nosaved: false,
              ),
            )

            Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: MessageCard(
                username: "Rahul",
                phonenumber: "7036XXXXXX",
                groupname: "Neonflake",
                information:
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                now: now,
                monthname: monthName,
                IndianTime: indianTime,
                ontapfunc: () {
                  vm.SavedMessages.add([
                    "Rahul",
                    "7036XXXXXX",
                    "Neonflake",
                    "The Random Text feature. Creating random text is simple. To start, type =rand() and then click Enter in your document. Several paragraphs of randomly generated text will appear. You can also use this function to specify the number of paragraphs and sentences in each paragraph.",
                    now,
                    monthName,
                    indianTime,
                  ]);
                  vm.update();
                  print("added");
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Saved'),
                  ));
                },
                nosaved: false,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (ans) {
                    Noti.noshowBigTextNotification(
                        title: "Sample",
                        body: "IT IS WORKING",
                        s: vm.userstarttime,
                        e: vm.userendtime);
                  } else {
                    vm.soundSelected
                        ? Noti.showBigTextNotification(
                            title: "sample", body: "it is working")
                        : Noti.vibshowBigTextNotification(
                            title: "sample", body: "It is working");
                  }
                },
                child: const Text("press me")),
          ],
            */