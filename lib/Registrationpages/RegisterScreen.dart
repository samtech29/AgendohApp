import 'package:agendoh/inc/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../LoginScreen/loginScreen.dart';
import 'genderbirthscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final First_Name = new TextEditingController();
  final Last_Name = new TextEditingController();
  final Username = new TextEditingController();
  final Password = new TextEditingController();

  var url = (Apis.baseurl + "SignUp.php");
  var data;
  String? Role;
  // String? Store;

  var url1 = (Apis.baseurl + "T_SignUp_ReadAPI.php");
  var data1;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Postdata() async {
    var res = await http.post(Uri.parse(url), body: {
      "First_Name": First_Name.text,
      "Last_Name": Last_Name.text,
      "Username": Username.text,
      "Password": Password.text,
      "Gender": "",
      "Date_of_Birth": "",
      "Docs": "",
      "Register_as": "",
    });
    data = (res.body);

    print(data);
  }

  getdata() async {
    var res1 = await http.get(
      Uri.parse(url1),
    );
    data1 = jsonDecode(res1.body);
    print(data1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        // brightness: Brightness.light,
        // backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                            Container(
                                height: 130,
                                child: Image.asset("assets/agendohh.png")),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       RadioListTile(
                    //         activeColor: Colors.blue,
                    //         title: Text(
                    //           "Service User",
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //         value: "user",
                    //         groupValue: user,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             user = value.toString();
                    //           });
                    //         },
                    //       ),
                    //       RadioListTile(
                    //         activeColor: Colors.blue,
                    //         title: Text(
                    //           "Register Store",
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //         value: "Store",
                    //         groupValue: Store,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             Store = value.toString();
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: First_Name,
                                  decoration: InputDecoration(
                                    // hintText: "First Name",
                                    labelText: "First Name",
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
                                  controller: Last_Name,
                                  decoration: InputDecoration(
                                    // hintText: "First Name",
                                    labelText: "Last Name",
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: Username,
                                  decoration: InputDecoration(
                                    // hintText: "First Name",
                                    labelText: "Username",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: Password,
                                  decoration: InputDecoration(
                                    // hintText: "First Name",
                                    labelText: "Create Password",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          InkWell(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () async {
          await Postdata();
          await getdata();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GenBirth(data1[0]["ID"])));

          setState(() {});
        },
        tooltip: 'Open New Page',
        child: new Icon(Icons.navigate_next),
      ),
    );
  }
}
