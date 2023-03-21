import 'package:agendoh/Menubarpages/MyAccount/EditProfile.dart';
import 'package:agendoh/ShopOwner/Dashboard.dart';
import 'package:agendoh/ShopOwner/Shop_BottomNav/Shop_bottombar.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../tabscreen/Allshop.dart';

void main() {
  runApp(MaterialApp(
    title: "Personal info",
    theme: ThemeData.dark(),
    darkTheme: ThemeData.dark(),
    // home: personalinfo(),
  ));
}

class T_Personalinfo extends StatefulWidget {
  const T_Personalinfo({super.key});

  @override
  State<T_Personalinfo> createState() => _T_PersonalinfoState();
}

class _T_PersonalinfoState extends State<T_Personalinfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var readurl = Apis.baseurl + 'T_A_Users_ReadAPI.php';
  var readdata;

  getdata() async {
    var res = await http.post(Uri.parse(readurl),
        body: {"single": '1', "myid": await readsession("id")});
    readdata = jsonDecode(res.body);
    print(readdata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(readdata[0]["ID"]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Personal Info"),
          centerTitle: true,
          // Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.white),
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Shop_Bottombar()));
          //   },
          // ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            )
          ],
        ),
        body: readdata != null
            ? SingleChildScrollView(
                child: Container(
                    child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            child: CircleAvatar(
                              radius: 50,
                              child: CircleAvatar(
                                  radius: 52,
                                  backgroundImage: NetworkImage(
                                    Apis.baseurl +
                                        "test/uploads/" +
                                        readdata[0]["Profile_image"],
                                  ),
                                  backgroundColor: Colors.transparent),
                            )),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Form(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [Text("First Name")],
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          // hintText: "First Name",
                                          labelText: readdata[0]["First_Name"],
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                        ),
                                        enabled: false,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [Text("Last Name")],
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          // hintText: "First Name",
                                          labelText: readdata[0]["Last_Name"],
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                        ),
                                        enabled: false,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [Text("Phone Number")],
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          // hintText: "First Name",
                                          labelText: readdata[0]
                                              ["Phone_Number"],
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                        ),
                                        enabled: false,
                                        // maxLength: 10,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [Text("Email Id")],
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: readdata[0]["Email"],
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                        ),
                                        enabled: false,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [Text("Location")],
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: readdata[0]["Location"],
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                        ),
                                        enabled: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
