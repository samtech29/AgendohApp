import 'package:agendoh/Registrationpages/thirsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:agendoh/inc/Config.dart';

class GenBirth extends StatefulWidget {
  final String ID;
  const GenBirth(this.ID, {super.key});

  @override
  State<GenBirth> createState() => _GenBirthState();
}

class _GenBirthState extends State<GenBirth> {
  final Gender = new TextEditingController();

  final Date_of_Birth = new TextEditingController();

  var url = (Apis.baseurl + "T_UpdateGD.php");
  var data1;

  Postdata() async {
    var res = await http.post(Uri.parse(url), body: {
      "id": widget.ID,
      "Gender": Gender.text,
      "Date_of_Birth": Date_of_Birth.text,
      "Docs": "",
      "Register_as": "",
    });
    data1 = (res.body);

    print(data1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(widget.ID),
                          Container(
                              height: 130,
                              child: Image.asset("assets/agendohh.png")),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: Gender,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Gender",
                                  labelStyle: TextStyle(color: Colors.black),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: Date_of_Birth,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Date of birth",
                                  labelStyle: TextStyle(color: Colors.black),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        // border: Border(
                        //     bottom: BorderSide(color: Colors.black),
                        //     top: BorderSide(color: Colors.black),
                        //     right: BorderSide(color: Colors.black),
                        //     left: BorderSide(color: Colors.black)
                        // )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () async {
          await Postdata();
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => ThirdScreen(widget.ID)));
          setState(() {});
        },
        tooltip: 'Open New Page',
        child: new Icon(Icons.navigate_next),
      ),
    );
  }
}

Widget makeInput({hint, label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
