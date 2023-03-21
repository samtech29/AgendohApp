import 'dart:convert';

import 'package:agendoh/Message/chatScreen.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: "Message list",
  ));
}

class Messagelist extends StatefulWidget {
  final String ID;

  const Messagelist(this.ID, {super.key});

  @override
  State<Messagelist> createState() => _MessagelistState();
}

class _MessagelistState extends State<Messagelist> {
  var url = Apis.baseurl + 'T_Read_Messegeslist.php';
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    var res = await http.post(Uri.parse(url),
        body: {"sid": await readsession("id"), "rid": widget.ID});

    data = jsonDecode(res.body);

    print(data.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        actions: [],
      ),
      body: data != null
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        child: CircleAvatar(
                      backgroundImage: AssetImage('assets/hairdresser.jpeg'),
                    )),
                    title: Text(
                      data[index]["Username"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[800]),
                    ),
                    subtitle: Text(
                      data[index]["message"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey[600]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  data[index]["ID"], data[index]["Username"])));
                    },
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => GenBirth()));
        },
        tooltip: 'Open New Page',
        child: new Icon(Icons.add),
      ),
    );
  }
}
