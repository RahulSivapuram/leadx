import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  String _selectedFrequency = 'Immediate';
  HomeController vm = Get.find();
  TimeOfDay _startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 0, minute: 0);

  String _selectedOff = 'Off';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Constants().draw(context, Constants().number1),
        appBar: AppBar(
          title: const Text(
            "Notification Setting",
            style: TextStyle(color: Colors.black),
          ),
          //backgroundColor: Colors.blueAccent,
        ),
        body: GetBuilder<HomeController>(
          builder: (vm) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 240, 242, 243),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          "Frequency of Alerts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Radio<String>(
                              value: 'Immediate',
                              groupValue: _selectedFrequency,
                              onChanged: (value) {
                                setState(() {
                                  _selectedFrequency = value!;
                                });
                              },
                            ),
                            title: const Text(
                              "Immediate",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          ListTile(
                            trailing: Radio<String>(
                              groupValue: _selectedFrequency,
                              value: "Daily Summaries",
                              onChanged: (value) {
                                setState(() {
                                  _selectedFrequency = value!;
                                });
                              },
                            ),
                            title: const Text(
                              "Daily Summaries",
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 240, 242, 243),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          "Sound and Vibration",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Enable Sound",
                                style: TextStyle(fontSize: 14),
                              ),
                              Switch(
                                  value: vm.soundSelected,
                                  activeColor: Colors.blueAccent,
                                  onChanged: (bool value) {
                                    setState(() {
                                      vm.soundSelected = value;
                                    });
                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Enable Vibration",
                                style: TextStyle(fontSize: 14),
                              ),
                              Switch(
                                  value: vm.vibrationSelected,
                                  activeColor: Colors.blueAccent,
                                  onChanged: (bool value) {
                                    setState(() {
                                      vm.vibrationSelected = value;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 240, 242, 243),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          "Quiet Hours",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Enable Quiet Hours",
                                style: TextStyle(fontSize: 14),
                              ),
                              Switch(
                                value: vm.quietHour,
                                activeColor: Colors.blueAccent,
                                onChanged: (bool value) {
                                  vm.quietHour = value;
                                  vm.update();
                                },
                              ),
                            ],
                          ),
                          if (vm.quietHour)
                            Column(
                              children: [
                                _buildTimeDropdown(
                                  title: 'Start Time',
                                  time: _startTime,
                                  isStartTime: true,
                                ),
                                const SizedBox(height: 10),
                                _buildTimeDropdown(
                                  title: 'End Time',
                                  time: _endTime,
                                  isStartTime: false,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () {
                        Get.snackbar(
                          "Notification Settings",
                          "Saved",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black,
                          colorText: Colors.white,
                          isDismissible: true,
                          forwardAnimationCurve: Curves.easeIn,
                          reverseAnimationCurve: Curves.easeOut,
                        );
                        print(vm.soundSelected);
                        print(vm.vibrationSelected);
                        print(_startTime);
                        print(_endTime);
                        print(vm.quietHour);
                      },
                      child: Container(
                          width: 120,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(10)),
                          ),
                          child: const Center(
                              child: Text(
                            "Save Changes",
                            style: TextStyle(color: Colors.white),
                          ))),
                    ))
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget _buildTimeDropdown({
    required String title,
    required TimeOfDay time,
    required bool isStartTime,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        items: [
          DropdownMenuItem(
            value: isStartTime ? 'start' : 'end',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  time.format(context),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
        onChanged: (value) {
          if (value == 'start') {
            _showTimePicker(isStartTime: true);
          } else if (value == 'end') {
            _showTimePicker(isStartTime: false);
          }
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _showTimePicker({required bool isStartTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
          vm.userstarttime = _startTime;
          vm.update();
        } else {
          _endTime = pickedTime;
          vm.userendtime = _endTime;
          vm.update();
        }
      });
    }
  }
}
