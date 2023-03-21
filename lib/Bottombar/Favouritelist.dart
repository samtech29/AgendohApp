import 'package:agendoh/Utils/Constants.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Favouritelist extends StatefulWidget {
  final String selectedid;
  const Favouritelist(this.selectedid, {super.key});

  @override
  State<Favouritelist> createState() => _FavouritelistState();
}

class _FavouritelistState extends State<Favouritelist> {
  Future readsession(var xyz) async {
    Constants.prefs = await SharedPreferences.getInstance();
    return Constants.prefs.getString(xyz);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var url = Apis.baseurl + "T_Read_Favouritelist.php";
  var data;

  getdata() async {
    var res = await http.post(Uri.parse(url), body: {
      "userid": await readsession("id"),
      "selected_id": widget.selectedid
    });
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite List"),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
          child: data != null
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/hairdresser.jpeg'),
                                radius: 30,
                              ),
                              radius: 30,
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              isThreeLine: true,
                              title: Text(
                                data[index]["Shop_Name"],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  data[index]["Shop_location"],
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // print('Button Pressed');
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => ChatScreen(
                                      //           data[index]["selected_id"],
                                      //           data[index]["Username"]),
                                      //     ));
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
              : Center(child: CircularProgressIndicator())),
    );
  }
}
