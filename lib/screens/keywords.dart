import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';

class KeywordPage extends StatefulWidget {
  final String number;
  const KeywordPage({super.key, required this.number});

  @override
  State<KeywordPage> createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  //List<String> keywords = ["Internships", "Job"];

  final TextEditingController _keywordcontroller = TextEditingController();
  HomeController vm = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Keywords",
            style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 79, left: 40, right: 40),
                                  child: Text(
                                    "Enter your keyword",
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Colors.black),
                                  ),
                                ),
                                //
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 16,
                                      top: 14,
                                    ),
                                    width: 250,
                                    height: 36,
                                    color: Color(0xFFF7F7FC),
                                    child: TextFormField(
                                      onChanged: (val) {},
                                      keyboardType: TextInputType.text,
                                      controller: _keywordcontroller,
                                      decoration: InputDecoration(
                                        hintText: "keyword",
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.mulish(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Color(0xFFADB5BD)),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      //print(_keywordcontroller.text);

                                      vm.keywords.add(_keywordcontroller.text);

                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Color(0xFF002DE3)),
                                      child: Center(
                                        child: Text(
                                          "Add",
                                          style: GoogleFonts.mulish(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        drawer: Constants().draw(context, widget.number),
        body: GetBuilder<HomeController>(
          builder: (vm) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 7, right: 15, top: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 8),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //border: Border.all(color: Colors.black, width: 5),
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(),
                                Container(
                                  padding: const EdgeInsets.only(left: 280),
                                  height: 80,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: Color(0xFF002DE3),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      vm.keywords.remove(vm.keywords[index]);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 15),
                                  height: 80,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        vm.keywords[index],
                                        style: GoogleFonts.mulish(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit_document,
                                          color: Color(0xFF002DE3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: vm.keywords.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
