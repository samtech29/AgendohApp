import 'dart:convert';

import 'package:agendoh/Appointmentspages/Addpayment_1.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'dart:ui';
import 'package:time_range/time_range.dart';

class Choose_Booking extends StatefulWidget {
  const Choose_Booking({super.key});

  @override
  State<Choose_Booking> createState() => _Choose_BookingState();
}

class _Choose_BookingState extends State<Choose_Booking> {
  final Bookdate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Slot"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Choose Your Slot Date",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    child: TextFormField(
                      controller: Bookdate,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 24, 24, 24))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 31, 31, 31))),
                        labelText: 'Choose Date',
                        hintText: "DD/MM/YYYY",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 134, 133, 133)),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));

                        if (pickeddate != null) {
                          setState(() {
                            Bookdate.text =
                                DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Open Store",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(122, 121, 122, 122)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  122, 121, 122, 122))))),
                              child: Text("10:00 Am")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "To",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(122, 121, 122, 122)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  122, 121, 122, 122))))),
                              child: Text("10:00 Pm")),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Available Schedule",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                TimeRange(
                  fromTitle: Text(
                    'From',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  toTitle: Text(
                    'To',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  titlePadding: 20,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black87),
                  activeTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  borderColor: Colors.blue,
                  backgroundColor: Colors.transparent,
                  activeBackgroundColor: Colors.blue,
                  firstTime: TimeOfDay(hour: 10, minute: 00),
                  lastTime: TimeOfDay(hour: 22, minute: 00),
                  timeStep: 30,
                  timeBlock: 60,
                  onRangeCompleted: (range) => setState(() => print(range)),
                ),
                // Container(
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: SizedBox(
                //           height: 40,
                //           width: 100,
                //           child: ElevatedButton(
                //               onPressed: () {},
                //               style: ButtonStyle(
                //                   backgroundColor: MaterialStateProperty.all(
                //                       Color.fromARGB(122, 121, 122, 122)),
                //                   shape: MaterialStateProperty.all<
                //                           RoundedRectangleBorder>(
                //                       RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(10.0),
                //                           side: BorderSide(
                //                               color: Color.fromARGB(
                //                                   122, 121, 122, 122))))),
                //               child: Text("11:00 Am")),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: Text(
                //           "To",
                //           style:
                //               TextStyle(fontSize: 18, color: Colors.grey[700]),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: SizedBox(
                //           height: 40,
                //           width: 100,
                //           child: ElevatedButton(
                //               onPressed: () {},
                //               style: ButtonStyle(
                //                   backgroundColor: MaterialStateProperty.all(
                //                       Color.fromARGB(122, 121, 122, 122)),
                //                   shape: MaterialStateProperty.all<
                //                           RoundedRectangleBorder>(
                //                       RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(10.0),
                //                           side: BorderSide(
                //                               color: Color.fromARGB(
                //                                   122, 121, 122, 122))))),
                //               child: Text("06:00 Pm")),
                //         ),
                //       ),
                //       // Padding(
                //       //   padding: const EdgeInsets.only(left: 10),
                //       //   child: CircleAvatar(
                //       //     backgroundColor: Colors.blue,
                //       //     radius: 20,
                //       //     child: Icon(
                //       //       Icons.add,
                //       //     ),
                //       //   ),
                //       // )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Upload Reports File",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(122, 121, 122, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                122, 121, 122, 122))))),
                            child: Icon(
                              Icons.upload,
                              color: Colors.blue,
                            )),
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
                                      builder: (context) => Addpayment_1()));
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
                            child: Text("Next")),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         setState(() {});
                //         // Fluttertoast.showToast(
                //         //     msg: "Your audition is posted",
                //         //     backgroundColor: Colors.green);
                //       },
                //       style: ElevatedButton.styleFrom(
                //         primary: Color.fromARGB(255, 243, 180, 7),
                //         minimumSize: const Size.fromHeight(50),
                //       ),
                //       child: Text(
                //         "Post",
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 18,
                //         ),
                //       )),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
