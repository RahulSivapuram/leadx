import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadx/constants.dart';
import 'package:leadx/screens/home.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final obj = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draw(context, ""),
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: GoogleFonts.mulish(
              fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        //height: MediaQuery.of(context).size.height / 2,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How can we help?",
              style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Search for the topic you need help with or contact our support",
              style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: "Search"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Text(
              "Frequently Asked Questions:",
              style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: obj.FAQuestions.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text(obj.FAQuestions[index]![0]),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(obj.FAQuestions[index]![1]),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
