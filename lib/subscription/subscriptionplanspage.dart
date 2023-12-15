import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:leadx/screens/home.dart';

class PaymentPlansPage extends StatefulWidget {
  final bool afterotpval;
  const PaymentPlansPage({super.key, required this.afterotpval});

  @override
  State<PaymentPlansPage> createState() => _PaymentPlansPageState();
}

class _PaymentPlansPageState extends State<PaymentPlansPage> {
  bool checkboxval = false;
  bool starterplan = false;
  bool proplan = false;
  HomeController vm = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subscription Plans",
            style: GoogleFonts.mulish(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: widget.afterotpval
            ? const Text("")
            : draw(context, Constants().number1),
        body: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    starterplan = !starterplan;
                  });
                },
                child: paymentCard(context, const Color(0xFF002De3),
                    Colors.white, "Starter Plan", "100", 10, starterplan),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    proplan = !proplan;
                  });
                },
                child: paymentCard1(context, Colors.white,
                    const Color(0xFF002De3), "Pro Plan", "200", 20, proplan),
              ),

              //

              Row(
                children: [
                  Checkbox(
                    value: checkboxval,
                    onChanged: (bool) {
                      setState(() {
                        checkboxval = !checkboxval;
                      });
                    },
                  ),
                  //
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Text(
                      "By checking this box, you acknowledge that you have read, understood, and agree to abide by Leadesh's Terms and Conditions and Privacy Policy.",
                      style: GoogleFonts.mulish(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),

              //

              (starterplan || proplan)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: GestureDetector(
                        onTap: () {
                          const snackdemo = SnackBar(
                            content: Text('Select any plan'),
                            backgroundColor: Colors.red,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );

                          if ((starterplan || proplan) && checkboxval) {
                            if (starterplan == true) {
                              vm.finalselectedplan = "Basic Plan";
                              print(vm.finalselectedplan);
                              vm.update();
                            } else {
                              vm.finalselectedplan = "Pro Plan";
                              vm.update();
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const Home(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackdemo);
                          }
                        },
                        child: button(Colors.green, "Subscribe Now", 60,
                            Colors.white, 300, 20),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: button(Colors.green, "Start your 7-day trial", 60,
                          Colors.white, 300, 20),
                    ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: SizedBox(
                  width: 300,
                  child: Expanded(
                    child: Text(
                      "Your first 7 days are on us! No commitments,no credit card required during the trial",
                      style: GoogleFonts.mulish(
                        color: const Color(0xFF002De3),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget? button(Color reqcolor, String text, double h, Color textcolor, double w,
    double radius) {
  return Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: reqcolor,
    ),
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.mulish(
            fontWeight: FontWeight.bold, fontSize: 20, color: textcolor),
      ),
    ),
  );
}

Widget? paymentCard(
  BuildContext context,
  Color backcolor,
  Color textcolor,
  String title,
  String price,
  int nk,
  bool startselect,
) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: startselect ? Colors.black : textcolor, width: 5)),
    color: backcolor,
    elevation: 5,
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width / 1,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 20),
                child: Text(
                  title,
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 5),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/rupee-indian.png",
                  height: 20,
                  width: 20,
                  color: textcolor,
                ),
                Text(
                  price,
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
                Text(
                  " / per month",
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Monitor upto $nk keywords",
                    style: GoogleFonts.mulish(
                        color: textcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget? paymentCard1(
  BuildContext context,
  Color backcolor,
  Color textcolor,
  String title,
  String price,
  int nk,
  bool proselect,
) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side:
            BorderSide(color: proselect ? Colors.black : textcolor, width: 5)),
    color: backcolor,
    elevation: 5,
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width / 1,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 20),
                child: Text(
                  title,
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 5),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/rupee-indian.png",
                  height: 20,
                  width: 20,
                  color: textcolor,
                ),
                Text(
                  price,
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
                Text(
                  " / per month",
                  style: GoogleFonts.mulish(
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Monitor upto $nk keywords",
                    style: GoogleFonts.mulish(
                        color: textcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
