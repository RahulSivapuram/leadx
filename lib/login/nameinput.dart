import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/login/mobilenumber.dart';
import 'package:leadx/login/auth/auth_controller.dart';

class InputName extends StatefulWidget {
  const InputName({super.key});

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  final TextEditingController _namecontroller = TextEditingController();
  final int maxLength = 25;
  int res = 25;

  void updateres(int n) {
    setState(() {
      res = (n - maxLength).abs();
    });
  }

  Authcontroller vm = Get.isRegistered<Authcontroller>()
      ? Get.find<Authcontroller>()
      : Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Authcontroller>(builder: (vm) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        weight: 16,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 79, left: 40, right: 40),
                child: Text(
                  "What's your name?",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 20, right: 14),
                child: Row(
                  children: [
                    Container(
                        width: 74,
                        height: 36,
                        color: const Color(0xFFF7F7FC),
                        child: Icon(Icons.person_rounded)),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 16,
                        top: 14,
                      ),
                      width: 250,
                      height: 36,
                      color: Color(0xFFF7F7FC),
                      child: TextFormField(
                        onChanged: (val) {
                          updateres(_namecontroller.text.length);
                        },
                        keyboardType: TextInputType.text,
                        controller: _namecontroller,
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFFADB5BD)),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 40, right: 40),
                child: Text(
                  "${res} characters remaining",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 81),
                child: GestureDetector(
                  onTap: () {
                    vm.name.value = _namecontroller.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginMobile()),
                    );
                  },
                  child: Constants().buttonh("Continue"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
