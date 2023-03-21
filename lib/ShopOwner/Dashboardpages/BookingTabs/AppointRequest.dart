import 'package:agendoh/Message/messagelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AppointmentRequest extends StatefulWidget {
  const AppointmentRequest({super.key});

  @override
  State<AppointmentRequest> createState() => _AppointmentRequestState();
}

class _AppointmentRequestState extends State<AppointmentRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Apointment Request"),
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
          return SingleChildScrollView(
            child: Container(
              //height: 200,
              child: Column(
                children: [
                  // Card(
                  //   child: Image.asset("assets/fruit.png"),
                  // ),

                  ListTile(
                    leading: CircleAvatar(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/hairdresser.jpeg'),
                        radius: 22,
                      ),
                      radius: 22,
                    ),
                    title: Text(
                      "Person Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[800]),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: 15,
                              color: Colors.green,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "**********",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              'DD/MM/YYYY 11am-12pm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // trailing: Column(
                    //   children: [
                    //     InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AppointmentRequest()));
                    //         },
                    //         child: CircleAvatar(
                    //             backgroundColor: Colors.grey[600],
                    //             radius: 15,
                    //             child: Icon(Icons.clear))),
                    //     InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AppointmentRequest()));
                    //         },
                    //         child: CircleAvatar(
                    //             backgroundColor: Colors.grey[600],
                    //             radius: 15,
                    //             child: Icon(Icons.check))),
                    //   ],
                    // ),
                  ),

                  ListTile(
                    title: Text("Hello Sir\n\n"
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac molestie nisl, nec aliquet leo. Aenean nec dictum metus. Nam vel tincidunt risus, eget euismod quam. Phasellus commodo augue id ex tempor,"
                        " molestie efficitur velit auctor. Nunc ullamcorper pulvinar enim, quis blandit ligula gravida at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse ultricies sodales arcu sed accumsan. Etiam sed elementum orci. Morbi accumsan."),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.file_download,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Download Attach Reports"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                                          side:
                                              BorderSide(color: Colors.blue)))),
                              child: Text("Reject")),
                        ),
                        SizedBox(
                          height: 40, //height of button
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side:
                                              BorderSide(color: Colors.blue)))),
                              child: Text("Accept")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
