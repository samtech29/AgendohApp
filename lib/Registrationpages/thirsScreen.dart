import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../LoginScreen/loginScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:agendoh/inc/Config.dart';

class ThirdScreen extends StatefulWidget {
  final String ID;
  const ThirdScreen(this.ID, {super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final Docs = new TextEditingController();
  // var selected = "abc";

  var url = (Apis.baseurl + "T_UpdateGD.php");
  var data1;
  String? Role;

  Postdata() async {
    var res = await http.post(Uri.parse(url), body: {
      "id": widget.ID,
      "Docs": Docs.text,
      "Register_as": Role,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Text(widget.ID),
                Container(
                    height: 130, child: Image.asset("assets/agendohh.png")),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: Docs,
                          decoration: InputDecoration(
                            // hintText: "First Name",
                            labelText: "Attached your docoument",
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
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    RadioListTile(
                      activeColor: Colors.blue,
                      title: Text(
                        "Service User",
                        style: TextStyle(color: Colors.black),
                      ),
                      value: "user",
                      groupValue: Role,
                      onChanged: (value) {
                        setState(() {
                          Role = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      activeColor: Colors.blue,
                      title: Text(
                        "Register Store",
                        style: TextStyle(color: Colors.black),
                      ),
                      value: "Store",
                      groupValue: Role,
                      onChanged: (value) {
                        setState(() {
                          Role = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                // if (Role == "user")
                //   ...[]
                // else ...[
                //   Container(
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 40),
                //       child: DropdownButtonFormField(
                //         dropdownColor: Colors.white,
                //         style: TextStyle(color: Colors.black),
                //         icon: Icon(Icons.keyboard_arrow_down_sharp),
                //         onChanged: (v) {
                //           selected = v.toString();
                //         },
                //         decoration: InputDecoration(
                //           contentPadding:
                //               EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20),
                //             borderSide: BorderSide(
                //               color: Colors.blue,
                //             ),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20),
                //             borderSide: BorderSide(
                //               color: Colors.blue,
                //             ),
                //           ),
                //           labelText: "Category",
                //           labelStyle: TextStyle(color: Colors.black),
                //         ),
                //         items: [
                //           DropdownMenuItem(
                //             child: Text(
                //               "Groomer",
                //               style: TextStyle(fontSize: 15),
                //             ),
                //             value: "Groomer",
                //           ),
                //           DropdownMenuItem(
                //             child: Text(
                //               "Dentist",
                //               style: TextStyle(fontSize: 15),
                //             ),
                //             value: "Dentist",
                //           ),
                //           DropdownMenuItem(
                //             child: Text(
                //               "Nutritionist",
                //               style: TextStyle(fontSize: 15),
                //             ),
                //             value: "Nutritionist",
                //           ),
                //           DropdownMenuItem(
                //             child: Text(
                //               "Cleaning Service",
                //               style: TextStyle(fontSize: 15),
                //             ),
                //             value: "Cleaning Service",
                //           ),
                //           DropdownMenuItem(
                //             child: Text(
                //               "Hair Dresser",
                //               style: TextStyle(fontSize: 15),
                //             ),
                //             value: "Hair Dresser",
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ]
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Postdata();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
          showToastMessage("Your Account Created Successfully");
          setState(() {});
        },
        tooltip: 'Open New Page',
        child: new Icon(Icons.navigate_next),
      ),
    );
  }

  //create this function, so that, you needn't to configure toast every time
  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.white, //message text color
        fontSize: 16.0 //message font size
        );
  }
}
