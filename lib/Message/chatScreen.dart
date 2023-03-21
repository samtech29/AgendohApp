import 'dart:async';
import 'dart:convert';

// import '../bottombarpages/Mainpage.dart';
// import 'chatmodel.dart';
import 'package:agendoh/Message/replycard.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

import '../tabscreen/Allshop.dart';
import 'ownmessagecard.dart';

class ChatScreen extends StatefulWidget {
  final String ID;
  final String Username;
  const ChatScreen(this.ID, this.Username, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final message = new TextEditingController();
  ScrollController _ctrl = ScrollController();

  late String _now;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();

    print("hello");
    getdata();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _now = DateTime.now().second.toString();
  //   _everySecond = Timer.periodic(Duration(seconds: 1), (Timer) {
  //     setState(() {
  //       _now = DateTime.now().second.toString();
  //       _ctrl.animateTo(_ctrl.position.maxScrollExtent,
  //           duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //     });
  //     print("hello");
  //     getdata();
  //   });

  //   getdata();
  // }

  var url = Apis.baseurl + "T_ReadChatApi.php";
  var data;
  getdata() async {
    var res = await http.post(Uri.parse(url), body: {
      "sid": await readsession("id"),
      "rid": widget.ID,
    });

    data = jsonDecode(res.body);

    print(data.length);
    setState(() {});
  }

  var messageurl = Apis.baseurl + "T_IncertChatApi.php";
  var messagedata;

  postmessage() async {
    var resp = await http.post(Uri.parse(messageurl), body: {
      "senderid": await readsession('id'),
      "receiverid": widget.ID,
      "message": message.text,
      "status": "sent"
    });
    messagedata = (resp.body);
    print(messagedata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            leadingWidth: 70,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/hairdresser.jpeg'),
                  )),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (widget.Username),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   "last seen today at 11:09 pm",
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            // height: MediaQuery.of(context).size.height,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                data != null
                    ? Expanded(
                        child: ListView.builder(
                            // shrinkWrap: true,
                            // reverse: true,
                            controller: _ctrl,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, index) {
                              return data[index]["sender_id"] ==
                                      readsession("id")
                                  ? OwnMessageCard(
                                      message: data[index]["message"],
                                      time: DateTime.now()
                                          .toString()
                                          .substring(10, 16))
                                  : ReplyCard(
                                      message: data[index]["message"],
                                      time: DateTime.now()
                                          .toString()
                                          .substring(10, 16));
                            }),
                      )
                    : Center(child: Text("")),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                    margin: EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextFormField(
                                      controller: message,

                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      // maxLines: 5,
                                      // minLines: 1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a Message ",
                                        prefixIcon: IconButton(
                                          icon: Icon(Icons.emoji_emotions),
                                          onPressed: () {},
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.attach_file)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.camera_alt)),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(5),
                                      ),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, right: 5, left: 2),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.indigo,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    if (message.text == "") {
                                    } else {
                                      await postmessage();
                                      getdata();

                                      setState(() {
                                        message.clear();
                                      });
                                      _ctrl.animateTo(
                                          _ctrl.position.maxScrollExtent,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeOut);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
