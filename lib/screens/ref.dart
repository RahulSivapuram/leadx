import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/Home_Controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Refereal extends StatefulWidget {
  const Refereal({super.key});

  @override
  State<Refereal> createState() => _ReferealState();
}

class _ReferealState extends State<Refereal> {
  HomeController vm = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Referral"),
            centerTitle: true,
          ),
          drawer: Constants().draw(context, ""),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.black, width: 5),
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(20), child: Html(data: ''' 
                      <style>
      ul {
        padding: 0;
        margin: 0;
         
      }
      li {
        font-size: 18px; /* Adjust the font size as needed */
      }
      
    </style>
                  <div>
                  <h3>How it works:</h3>
                  <ul>
                  <li>Share the referral link with your friend</li>
                  <li>After your friend places their first order both get 50% on your next order</li>
                  <li>Upon 5 successful referrals,you earn 500</li>
                  </ul>

                  
              
            </div>
                ''')),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 5),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Html(
                          data: ''' 
                          <style>
                          p {
        font-size: 18px;
        margin:0; /* Adjust the font size as needed */
      }</style>
      <p>Hey!</p><p>I've been using Leadesh to stay on top of relevant conversations on WhatsApp.</p><p> Use</p><p> my referral code <strong>XFV155</strong> and get a 50% discount on your first month's subscription.</p>
''',
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Share.share("Invite Link");
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Invite via WhatsApp",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset("lib/images/whatsapp.png"),
                              ),
                            ],
                          ),
                        ),
                        //
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Share.share("Invite Link");
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Share Invite Link",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.ios_share_sharp))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black, width: 5),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Html(data: '''
<style>

p {
        font-size: 18px; /* Adjust the font size as needed */
      }
</style>
                      <h3>Remaining Invitations:</h3>
                    <p>You have ${5 - vm.referralpeople.length} invitations remaining. Invite your friends to join Leadesh and enjoy discounts together!</p> 
                      '''),
                          vm.referralpeople.isNotEmpty
                              ? Html(data: '''<h3>Registered Friends:</h3>''')
                              : Html(
                                  data:
                                      '''<p>No referrals yet.Share with friends to start saving!</p>'''),
                          if (vm.referralpeople.isNotEmpty)
                            for (int i = 0; i < vm.referralpeople.length; i++)
                              Html(data: '''<style>ul {
        padding: 0;
        margin: 0;
      }</style> <ul><li>Friend ${i + 1}</li><ul>''')
                          else
                            Text(" "),
                        ],
                      ),
                    )),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.black, width: 5),
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(20), child: Html(data: '''
<style>
ul {
        padding: 0;
        margin: 0;
      }
      li {
        font-size: 18px; /* Adjust the font size as needed */
      }
</style>
                  <div>
                  <h3>Referral Discount Rules:</h3>
              <ul>
                <li>When your friend registers with your code, they get a 50% discount on their first month.</li>
                <li>You receive a 50% discount on your next month's subscription for each friend who registers using your code.</li>
                <li>You can invite up to 5 friends.</li>
              </ul>
            </div>
                ''')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
