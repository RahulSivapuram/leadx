import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:leadx/screens/home.dart';

class SavedMessages extends StatefulWidget {
  const SavedMessages({super.key});

  @override
  State<SavedMessages> createState() => _SavedMessagesState();
}

class _SavedMessagesState extends State<SavedMessages> {
  Constants obj = Constants();
  bool nosaved = true;
  DateTime now = DateTime.now();
  HomeController vm = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Saved Messages'),
      ),
      drawer: Constants().draw(context, Constants().number1),
      body: GetBuilder<HomeController>(builder: (vm) {
        return ListView.builder(
            itemCount: vm.SavedMessages.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black, width: 3),
                ),
                child: MessageCard(
                    username: vm.SavedMessages[index][0],
                    phonenumber: vm.SavedMessages[index][1],
                    groupname: vm.SavedMessages[index][2],
                    information: vm.SavedMessages[index][3],
                    now: now,
                    monthname: vm.SavedMessages[index][5],
                    IndianTime: vm.SavedMessages[index][6],
                    ontapfunc: () {},
                    nosaved: true),
              );
            });
      }),
    );
  }
}





            /*
            MessageCard(
                  username: obj.SavedMessages[1][0],
                  phonenumber: obj.SavedMessages[1][1],
                  groupname: obj.SavedMessages[1][2],
                  information: obj.SavedMessages[1][3],
                  now: now,
                  monthname: obj.SavedMessages[1][5],
                  IndianTime: obj.SavedMessages[1][6],
                  ontapfunc: () {},
                  nosaved: true),
            */