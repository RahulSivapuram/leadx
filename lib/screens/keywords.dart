import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeywordPage extends StatefulWidget {
  final String number;
  const KeywordPage({super.key, required this.number});

  @override
  State<KeywordPage> createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  List<String> keywords = ["Internships", "Job"];

  final TextEditingController _keywordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Keywords",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF002DE3),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rahul',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.number,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )
                      ])),
              ListTile(
                title: const Text('Keywords'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => KeywordPage(
                            number: widget.number,
                          )));
                },
              ),
              ListTile(
                title: Text('Payment Plans'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Notifications'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: Text('About'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Terms And Conditions'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text('Version Number: 1.7.10'),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 300),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF002DE3),
                  ),
                  child: Center(
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

                                            setState(() {
                                              keywords
                                                  .add(_keywordcontroller.text);
                                            });
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
                                            )),
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, right: 15),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 5),
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
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: Color(0xFF002DE3),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  keywords.remove(keywords[index]);
                                });
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
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  keywords[index],
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
                    itemCount: keywords.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
