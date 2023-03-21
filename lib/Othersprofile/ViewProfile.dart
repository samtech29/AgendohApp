import 'package:agendoh/Appointmentspages/Addpayment_1.dart';
import 'package:agendoh/Appointmentspages/Choosedateslot.dart';
import 'package:agendoh/Message/chatScreen.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../inc/Config.dart';

class ViewProfile extends StatefulWidget {
  final String First_Name;
  final String Specialists;
  final String Profile_image;
  final String Shop_location;
  final String Work_Exp;

  const ViewProfile(this.First_Name, this.Specialists, this.Profile_image,
      this.Shop_location, this.Work_Exp,
      {super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Person Profile"),
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
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          var cardA;
          return Container(
            //height: 200,
            child: Column(
              children: [
                // Card(
                //   child: Image.asset("assets/fruit.png"),
                // ),
                SizedBox(
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(Apis.baseurl +
                              "test/uploads" +
                              widget.Profile_image),
                          //     AssetImage('assets/hairdresser.jpeg'),
                          radius: 30,
                        ),
                        radius: 30,
                      ),
                      title: Text(
                        widget.First_Name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey[800]),
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.Specialists,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Exp :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey[600]),
                              ),
                              Text(
                                widget.Work_Exp,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey[600]),
                              )
                            ],
                          ),
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
                                    widget.Shop_location,
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
                      trailing: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ChatScreen(

                              //             )));
                            },
                            child: Icon(Icons.chat),
                          ),
                          InkWell(
                            onTap: () {
                              //call your onpressed function here
                              print('Button Pressed');
                            },
                            child: Icon(Icons.call),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.white,
                  key: cardA,
                  leading: Icon(
                    Icons.dock_outlined,
                    size: 35,
                  ),
                  title: Text("Company Experience"),
                  // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac molestie nisl, nec aliquet leo. Aenean nec dictum metus. Nam vel tincidunt risus, eget euismod quam. Phasellus commodo augue id ex tempor,"
                          " molestie efficitur velit auctor. Nunc ullamcorper pulvinar enim, quis blandit ligula gravida at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse ultricies sodales arcu sed accumsan. Etiam sed elementum orci. Morbi accumsan.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.white,
                  key: cardA,
                  leading: Icon(
                    Icons.school,
                    size: 35,
                  ),
                  title: Text("Education"),
                  // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          "Education",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.white,
                  key: cardA,
                  leading: Icon(
                    Icons.school,
                    size: 35,
                  ),
                  title: Text("Awards"),
                  // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          "Awards",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.blue)))),
                            child: Text("Cancel")),
                      ),
                      SizedBox(
                        height: 40, //height of button
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Choose_Booking()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.blue)))),
                            child: Text("Book")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
