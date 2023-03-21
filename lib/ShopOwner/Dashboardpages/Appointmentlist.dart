import 'package:agendoh/Message/messagelist.dart';
import 'package:agendoh/ShopOwner/Dashboardpages/BookingTabs/AppointRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Appointmentlist extends StatefulWidget {
  const Appointmentlist({super.key});

  @override
  State<Appointmentlist> createState() => _AppointmentlistState();
}

class _AppointmentlistState extends State<Appointmentlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Apointment List"),
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
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          var cardA;
          return Container(
            //height: 200,
            child: Column(
              children: [
                // Card(
                //   child: Image.asset("assets/fruit.png"),
                // ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/hairdresser.jpeg'),
                        radius: 22,
                      ),
                      radius: 22,
                    ),
                    title: Text(
                      "Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey[800]),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Appointment request",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[600]),
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
                    trailing: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentRequest()));
                            },
                            child: Text("View")),
                      ],
                    ),
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
