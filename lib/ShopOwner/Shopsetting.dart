import 'dart:convert';
import 'dart:io';

import 'package:agendoh/Menubar/Menubar.dart';
import 'package:agendoh/ShopOwner/EditShopS.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../HomeScreen/HomePage.dart';
import 'package:http/http.dart' as http;

import '../inc/Config.dart';

class ShopSetting extends StatefulWidget {
  const ShopSetting({super.key});

  @override
  State<ShopSetting> createState() => _ShopSettingState();
}

class _ShopSettingState extends State<ShopSetting> {
  final Category = new TextEditingController();
  final Shop_Name = new TextEditingController();
  final Specialists = new TextEditingController();

  final Work_Exp = new TextEditingController();
  final Shop_location = new TextEditingController();
  final Education = new TextEditingController();
  final Awards = new TextEditingController();

  var selected = "";

  File? selectedImage;
  String base64Image = "";

  var msg = "Your Data updated Successfully";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        // base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var readurl = Apis.baseurl + 'T_ShopDetailsRead.php';
  var readdata;

  getdata() async {
    var response = await http.post(Uri.parse(readurl), body: {
      "single": '1',
      "userid": await readsession("id"),
      "Category": Category,
    });
    readdata = jsonDecode(response.body);
    Category.text = readdata[0]["Category"];
    Shop_Name.text = readdata[0]["Shop_Name"];
    Specialists.text = readdata[0]["Specialists"];

    Work_Exp.text = readdata[0]["Work_Exp"];
    Shop_location.text = readdata[0]["Shop_location"];
    Education.text = readdata[0]["Education"];
    Awards.text = readdata[0]["Awards"];

    print(readdata);
    setState(() {});
  }

  Future incertdata() async {
    final uri = Uri.parse(Apis.baseurl + "T_IncertShopDetails.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields["userid"] = await readsession("id");

    request.fields["Shop_Name"] = Shop_Name.text;
    request.fields["Specialists"] = Specialists.text;
    request.fields["Work_Exp"] = Work_Exp.text;
    request.fields["Shop_location"] = Shop_location.text;
    request.fields["Education"] = Education.text;
    request.fields["Awards"] = Awards.text;
    request.fields["Category"] = selected;

    if (selectedImage != null) {
      var pic = await http.MultipartFile.fromPath("file", selectedImage!.path);

      request.files.add(pic);
    }
    // var response = await request.send();
    http.Response response =
        await http.Response.fromStream(await request.send());
    //print("Result: ${response.statusCode}");
    //print(response.body);

    var result = jsonDecode(response.body.toString());
    print(result["Status"]);
    if (result["Status"] == "true") {
      print("++++++Success");
    } else {
      print("++++++ SOME ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("Shop Setting"),
          //brightness: Brightness.light,
          // backgroundColor: Colors.white,

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditShop()));
              },
            )
          ],
        ),
        body:
            // readdata != null
            //     ?
            SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          // Card(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.zero,
                          //   ),
                          //   child: Image.asset("assets/dentist.png"),
                          // ),
                          // Column(
                          //   children: [
                          //     TextButton(
                          //       child: Text("Change Banner"),
                          //       onPressed: () {
                          //         showModalBottomSheet<void>(
                          //           context: context,
                          //           builder: (BuildContext context) {
                          //             return Container(
                          //               height: 150,
                          //               color: Colors.white,
                          //               child: Center(
                          //                 child: Column(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   mainAxisSize: MainAxisSize.min,
                          //                   children: <Widget>[
                          //                     ListTile(
                          //                       leading: Icon(Icons.camera_alt),
                          //                       onTap: () {
                          //                         chooseImage("camera");
                          //                       },
                          //                       title: Text('Use Camera'),
                          //                     ),
                          //                     ListTile(
                          //                       leading:
                          //                           Icon(Icons.photo_library),
                          //                       title:
                          //                           Text('Choose from Gallery'),
                          //                       onTap: () {
                          //                         chooseImage("Gallery");
                          //                         Navigator.pop(context);
                          //                       },
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             );
                          //           },
                          //         );
                          //       },
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        style: TextStyle(color: Colors.black),
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                        onChanged: (v) {
                          selected = v.toString();
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          labelText: "Category",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Groomer",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: "Groomer",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Dentist",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: "Dentist",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Nutritionist",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: "Nutritionist",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Cleaning Service",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: "Cleaning Service",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Hair Dresser",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: "Hair Dresser",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: Shop_Name,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Shop Name",
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
                                controller: Specialists,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Specialists",
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
                                controller: Work_Exp,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Work Experience",
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
                                controller: Shop_location,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Shop Location",
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
                                controller: Education,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Education",
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
                                controller: Awards,
                                decoration: InputDecoration(
                                  // hintText: "First Name",
                                  labelText: "Awards",
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
                      padding: EdgeInsets.only(top: 20, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            minWidth: 120,
                            height: 40,
                            onPressed: () {
                              setState(() {});

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));
                            },
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: MaterialButton(
                              minWidth: 120,
                              height: 40,
                              onPressed: () async {
                                await incertdata();

                                setState(() {});

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomePage()));
                                // Fluttertoast.showToast(
                                //     msg: readdata != null ? msg : msg,
                                //     backgroundColor: Colors.green);
                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        // : Center(child: CircularProgressIndicator())
        );
  }
}
