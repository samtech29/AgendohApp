import 'dart:convert';
import 'dart:io';

import 'package:agendoh/Menubar/Menubar.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../HomeScreen/HomePage.dart';
import 'package:http/http.dart' as http;

import '../inc/Config.dart';

class EditShop extends StatefulWidget {
  const EditShop({super.key});

  @override
  State<EditShop> createState() => _EditShopState();
}

class _EditShopState extends State<EditShop> {
  final Shop_Name = new TextEditingController();
  final Specialists = new TextEditingController();

  final Work_Exp = new TextEditingController();
  final Education = new TextEditingController();
  final Awards = new TextEditingController();

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
      "Category": 'Dentist',
    });
    readdata = jsonDecode(response.body);

    Shop_Name.text = readdata[0]["Shop_Name"];
    Specialists.text = readdata[0]["Specialists"];

    Work_Exp.text = readdata[0]["Work_Exp"];
    Education.text = readdata[0]["Education"];
    Awards.text = readdata[0]["Awards"];

    print(readdata);
    setState(() {});
  }

  Future updatedata() async {
    final uri = Uri.parse(Apis.baseurl + "T_UpdShopDeatils.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields["userid"] = await readsession("id");

    request.fields["Shop_Name"] = Shop_Name.text;
    request.fields["Specialists"] = Specialists.text;
    request.fields["Work_Exp"] = Work_Exp.text;
    request.fields["Education"] = Education.text;
    request.fields["Awards"] = Awards.text;

    if (selectedImage != null) {
      var pic = await http.MultipartFile.fromPath("file", selectedImage!.path);

      request.files.add(pic);
    }
    // var response = await request.send();
    http.Response response =
        await http.Response.fromStream(await request.send());
    print("Result: ${response.statusCode}");
    print(response.body);

    if (response.statusCode == "true") {
      print("image Changed");
    } else {
      print("image not Changed");
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
          title: Text("Edit Shop"),
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
        ),
        body: readdata != null
            ? SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        Stack(children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.photo_library),
                            title: selectedImage != null
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  )
                                : Text("Change Shop Banner"),
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 150,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            onTap: () {
                                              chooseImage("camera");
                                            },
                                            title: Text('Use Camera'),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Choose from Gallery'),
                                            onTap: () {
                                              chooseImage("Gallery");
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );

                              setState(() {});
                            },
                          ),
                        ]),

                        // for (int i = 0; i < readdata.length; i++) ...[
                        //   Column(
                        //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Column(
                        //         children: [
                        //           Container(
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(5.0),
                        //               child: CircleAvatar(
                        //                   backgroundColor: Colors.grey[900],
                        //                   radius: 52,
                        //                   child: ClipOval(
                        //                       child: selectedImage != null
                        //                           ? Image.file(
                        //                               selectedImage!,
                        //                               fit: BoxFit.cover,
                        //                               height: 100,
                        //                               width: 100,
                        //                             )
                        //                           : readdata != null
                        //                               ? Image.network(
                        //                                   Apis.baseurl +
                        //                                       "test/uploads/" +
                        //                                       readdata[0][
                        //                                           "Profile_image"],
                        //                                   // fit: BoxFit.cover,
                        //                                   // height: 100,
                        //                                   // width: 100,
                        //                                 )
                        //                               : Text("choose image"))),
                        //             ),
                        //           ),
                        //           Column(
                        //             children: [
                        //               TextButton(
                        //                 child: Text("Change image"),
                        //                 onPressed: () {
                        //                   showModalBottomSheet<void>(
                        //                     context: context,
                        //                     builder: (BuildContext context) {
                        //                       return Container(
                        //                         height: 150,
                        //                         color: Colors.white,
                        //                         child: Center(
                        //                           child: Column(
                        //                             mainAxisAlignment:
                        //                                 MainAxisAlignment
                        //                                     .center,
                        //                             mainAxisSize:
                        //                                 MainAxisSize.min,
                        //                             children: <Widget>[
                        //                               ListTile(
                        //                                 leading: Icon(
                        //                                     Icons.camera_alt),
                        //                                 onTap: () {
                        //                                   chooseImage("camera");
                        //                                 },
                        //                                 title:
                        //                                     Text('Use Camera'),
                        //                               ),
                        //                               ListTile(
                        //                                 leading: Icon(Icons
                        //                                     .photo_library),
                        //                                 title: Text(
                        //                                     'Choose from Gallery'),
                        //                                 onTap: () {
                        //                                   chooseImage(
                        //                                       "Gallery");
                        //                                   Navigator.pop(
                        //                                       context);
                        //                                 },
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       );
                        //                     },
                        //                   );
                        //                 },
                        //               )
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ],
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                      await updatedata();
                                      await getdata();

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
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Text(
                                      "Update",
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
            : Center(child: CircularProgressIndicator()));
  }
}
