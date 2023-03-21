import 'dart:convert';

import 'package:agendoh/Othersprofile/ViewProfile.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import 'Allshop.dart';

class Nutritionist extends StatefulWidget {
  const Nutritionist({super.key});

  @override
  State<Nutritionist> createState() => _NutritionistState();
}

class _NutritionistState extends State<Nutritionist> {
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
      "all": '1',
      "userid": await readsession("id"),
      "Category": "Nutritionist"
    });
    readdata = jsonDecode(response.body);
    print(readdata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: readdata != null
            ? ListView.builder(
                itemCount: readdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 200,

                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Image.asset("assets/fruit.png"),
                        ),
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
                              spacing: 12, // space between two icons
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewProfile(
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
                                    onPressed: () {},
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
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
