import 'dart:convert';

import 'package:agendoh/Bottombar/Favouritelist.dart';
import 'package:agendoh/Message/chatScreen.dart';
import 'package:agendoh/Othersprofile/ViewProfile.dart';
import 'package:agendoh/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../inc/Config.dart';

class AllShop extends StatefulWidget {
  // final String id;

  const AllShop({super.key});

  @override
  State<AllShop> createState() => _AllShopState();
}

Future readsession(var abc) async {
  Constants.prefs = await SharedPreferences.getInstance();
  return Constants.prefs.getString(abc);
}

var ourText = "";

class _AllShopState extends State<AllShop> {
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
      "selectall": '1',
    });
    readdata = jsonDecode(response.body);
    print(readdata);
    setState(() {});
  }

  List<int> Favrtlistarray = [];

  var Favrtlisturl = "${Apis.baseurl}T_InsertFavouritelist.php";
  var Favrtlistinsertdata;

  insertshortlist(var selectedid) async {
    var res_insertFavrtlist = await http.post(Uri.parse(Favrtlisturl), body: {
      "userid": await readsession('id'),
      "selected_id": selectedid,
    });
    Favrtlistinsertdata = (res_insertFavrtlist.body);
    print(Favrtlistinsertdata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: readdata != null
            ? ListView.builder(
                itemCount: readdata.length,
                itemBuilder: (BuildContext context, int index) {
                  bool favorite;
                  favorite = Favrtlistarray.contains(index);
                  if (Favrtlistarray.contains(index)) {
                    favorite = true;
                  } else {
                    favorite = false;
                  }
                  return Container(
                    //height: 200,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 300,
                                width: double.infinity,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  child: Image.asset("assets/groomer1.jpeg"),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 20,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  radius: 20,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.favorite),
                                    color: favorite ? Colors.pink : Colors.grey,
                                    iconSize: 25,
                                    onPressed: () {
                                      insertshortlist(readdata[index]["id"]);
                                      getdata();

                                      setState(() {
                                        if (Favrtlistarray.contains(index)) {
                                          Favrtlistarray.remove(index);
                                        } else {
                                          Favrtlistarray.add(index);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   decoration: new BoxDecoration(),
                        //   child: Stack(
                        //     children: <Widget>[
                        //       Image.asset("assets/dentist.png"),
                        //       Positioned(
                        //         bottom: 125,
                        //         right: 8,
                        //         child: CircleAvatar(
                        //           backgroundColor: Colors.grey[600],
                        //           radius: 20,
                        //           child: IconButton(
                        //             padding: EdgeInsets.zero,
                        //             icon: Icon(Icons.edit),
                        //             color: Colors.black45,
                        //             iconSize: 20,
                        //             onPressed: () {},
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: ListTile(
                            title: Text(
                              readdata[index]["Shop_Name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey[800]),
                            ),
                            subtitle: Column(
                              children: <Widget>[
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

                                    // SizedBox(width: 50),
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
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Wrap(
                              spacing: 5, // space between two icons
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewProfile(

                                                  // readdata[index]["Username"],
                                                  readdata[index]["First_Name"],
                                                  readdata[index]
                                                      ["Specialists"],
                                                  readdata[index]
                                                      ["Profile_image"],
                                                  readdata[index]
                                                      ["Shop_location"],
                                                  readdata[index]
                                                      ["Work_Exp"])));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                    color: Colors.blue)))),
                                    child: Text("View")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChatScreen(
                                                  readdata[index]["id"],
                                                  readdata[index]
                                                      ["Username"])));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                    color: Colors.blue)))),
                                    child: Text("Chat")),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
