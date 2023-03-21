import 'dart:convert';
import 'dart:io';

import 'package:agendoh/Bottombar/bottomnavigation.dart';
import 'package:agendoh/Menubar/Menubar.dart';
import 'package:agendoh/Message/messagelist.dart';
import 'package:agendoh/ShopOwner/Dashboardpages/Appointmentlist.dart';
import 'package:agendoh/ShopOwner/Dashboardpages/BookingTabs/Tabs.dart';
import 'package:agendoh/ShopOwner/Dashboardpages/BookingTabs/TodayBooking.dart';
import 'package:agendoh/ShopOwner/Menubar/ShopMenu.dart';
import 'package:agendoh/ShopOwner/Shop_BottomNav/Shop_bottombar.dart';
import 'package:agendoh/ShopOwner/Shopsetting.dart';
import 'package:agendoh/Utils/Constants.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  final String ID;
  const Dashboard(this.ID, {super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

  Future readsession(var abc) async {
    Constants.prefs = await SharedPreferences.getInstance();
    return Constants.prefs.getString(abc);
  }
}

class _DashboardState extends State<Dashboard> {
  File? selectedImage;
  // File? _video;
  String base64Image = "";
  List<File> multipleImages = [];

  Future<void> pickImage(type) async {
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
      selectedImage = File(image.path);
      setState(() {
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
    var res = await http.post(Uri.parse(readurl), body: {
      "single": '1',
      "userid": await readsession("id"),
      "Category": 'Dentist',
    });
    readdata = jsonDecode(res.body);
    print(readdata);
    setState(() {});
  }

  @override
  Icon actionIcon = new Icon(Icons.search);
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: ShopMenubar(widget.ID),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("Dashboard"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopSetting()));
              },
            )
          ],
        ),
        body: readdata != null
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  var cardA;
                  return SingleChildScrollView(
                    child: Container(
                      //height: 200,
                      child: Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(),
                            child: Stack(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  child: Image.network(
                                    Apis.baseurl +
                                        "ShopBanner/" +
                                        readdata[0]["Shop_Banner"],
                                    height: 200,
                                    width: double.infinity,
                                  ),
                                ),
                                // Positioned(
                                //   bottom: 125,
                                //   right: 8,
                                //   child: CircleAvatar(
                                //     backgroundColor: Colors.grey[600],
                                //     radius: 20,
                                //     child: IconButton(
                                //       padding: EdgeInsets.zero,
                                //       icon: Icon(Icons.edit),
                                //       color: Colors.black45,
                                //       iconSize: 20,
                                //       onPressed: () {
                                //         showModalBottomSheet<void>(
                                //           context: context,
                                //           builder: (BuildContext context) {
                                //             return Container(
                                //               height: 150,
                                //               child: Center(
                                //                 child: Column(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.center,
                                //                   mainAxisSize: MainAxisSize.min,
                                //                   children: <Widget>[
                                //                     ListTile(
                                //                       leading: Icon(Icons.camera_alt),
                                //                       onTap: () {
                                //                         pickImage("camera");
                                //                         Navigator.pop(context);
                                //                       },
                                //                       title: Text('Use Camera'),
                                //                     ),
                                //                     ListTile(
                                //                       leading:
                                //                           Icon(Icons.photo_library),
                                //                       title:
                                //                           Text('Choose from Gallery'),
                                //                       onTap: () async {
                                //                         pickImage("Gallery");
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
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      Apis.baseurl +
                                          "test/uploads/" +
                                          readdata[0]["Profile_image"],
                                    ),
                                    radius: 30,
                                  ),
                                  radius: 30,
                                ),
                                title: Text(
                                  readdata[index]["First_Name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey[800]),
                                ),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        IconTheme(
                                          data: IconThemeData(
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          child: Icon(Icons.star),
                                        ),
                                        IconTheme(
                                          data: IconThemeData(
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          child: Icon(Icons.star),
                                        ),
                                        IconTheme(
                                          data: IconThemeData(
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          child: Icon(Icons.star),
                                        ),
                                        IconTheme(
                                          data: IconThemeData(
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          child: Icon(Icons.star),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '4.0',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '/ 5.0',
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              'Location : ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.grey[600]),
                                            ),
                                            Text(
                                              readdata[index]["Location"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.grey[600]),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: ListTile(
                              title: Text(
                                "Message List",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey[800]),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Messagelist(widget.ID)));
                              },
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: ListTile(
                              title: Text(
                                "Appointments",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey[800]),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Appointmentlist()));
                              },
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: ListTile(
                              title: Text(
                                "Booking History",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey[800]),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookingTabs()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
