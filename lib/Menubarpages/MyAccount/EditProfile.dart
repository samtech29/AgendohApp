import 'dart:convert';
import 'dart:io';

import 'package:agendoh/Menubar/Menubar.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:agendoh/testpages/T_Personalinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../HomeScreen/HomePage.dart';
import 'package:http/http.dart' as http;

import '../../inc/Config.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final First_Name = new TextEditingController();
  final Last_Name = new TextEditingController();
  final Phone_Number = new TextEditingController();
  final Email = new TextEditingController();
  final Location = new TextEditingController();

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

  var readurl = Apis.baseurl + 'T_A_Users_ReadAPI.php';
  var readdata;

  getdata() async {
    var response = await http.post(Uri.parse(readurl),
        body: {"single": '1', "myid": await readsession("id")});
    readdata = jsonDecode(response.body);

    First_Name.text = readdata[0]["First_Name"];
    Last_Name.text = readdata[0]["Last_Name"];
    Phone_Number.text = readdata[0]["Phone_Number"];
    Email.text = readdata[0]["Email"];
    Location.text = readdata[0]["Location"];

    print(readdata);
    setState(() {});
  }

  Future updatedata() async {
    final uri = Uri.parse(Apis.baseurl + "T_A_UpdUsersdetailAPI.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields["myid"] = await readsession("id");

    request.fields["First_Name"] = First_Name.text;
    request.fields["Last_Name"] = Last_Name.text;
    request.fields["Phone_Number"] = Phone_Number.text;
    request.fields["Email"] = Email.text;
    request.fields["Location"] = Location.text;
    if (selectedImage != null) {
      var pic = await http.MultipartFile.fromPath("file", selectedImage!.path);

      request.files.add(pic);
      print("+++++++++++");
      print(selectedImage);
    }
    // var response = await request.send();
    http.Response response =
        await http.Response.fromStream(await request.send());

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
          title: Text("Edit Profile"),
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
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        for (int i = 0; i < readdata.length; i++) ...[
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.grey[900],
                                          radius: 52,
                                          child: ClipOval(
                                              child: selectedImage != null
                                                  ? Image.file(
                                                      selectedImage!,
                                                      fit: BoxFit.cover,
                                                      height: 100,
                                                      width: 100,
                                                    )
                                                  : readdata != null
                                                      ? Image.network(
                                                          Apis.baseurl +
                                                              "test/uploads/" +
                                                              readdata[0][
                                                                  "Profile_image"],
                                                          // fit: BoxFit.cover,
                                                          // height: 100,
                                                          // width: 100,
                                                        )
                                                      : Text("choose image"))),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      TextButton(
                                        child: Text("Change image"),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                height: 150,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      ListTile(
                                                        leading: Icon(
                                                            Icons.camera_alt),
                                                        onTap: () {
                                                          chooseImage("camera");
                                                        },
                                                        title:
                                                            Text('Use Camera'),
                                                      ),
                                                      ListTile(
                                                        leading: Icon(Icons
                                                            .photo_library),
                                                        title: Text(
                                                            'Choose from Gallery'),
                                                        onTap: () {
                                                          chooseImage(
                                                              "Gallery");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
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
                                      controller: Last_Name,
                                      decoration: InputDecoration(
                                        // hintText: "First Name",
                                        labelText: "Last Name",
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
                                      controller: Phone_Number,
                                      decoration: InputDecoration(
                                        // hintText: "First Name",
                                        labelText: "Phone Number",
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
                                      keyboardType: TextInputType.number,
                                      // maxLength: 10,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: Email,
                                      decoration: InputDecoration(
                                        labelText: "Email id",
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
                                      controller: Location,
                                      decoration: InputDecoration(
                                        labelText: "Location",
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

                                      Fluttertoast.showToast(
                                          msg: readdata != null ? msg : msg,
                                          backgroundColor: Colors.green);
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  T_Personalinfo()));
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
