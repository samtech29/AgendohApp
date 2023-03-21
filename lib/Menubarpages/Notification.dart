import 'package:agendoh/homeScreen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Notifications"),
        //brightness: Brightness.light,
        // backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => HomePage()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: CircleAvatar(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/hairdresser.jpeg'),
                      radius: 30,
                    ),
                    radius: 30,
                  ),
                ),
                Flexible(
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(
                      "Confirm your Apoitment",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Please, arrive 10 minutes before the scheduled time for registration.. Thank you',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    trailing: Text(
                      "10 min ago",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                    // leading: Icon(
                    //   Icons.notifications,
                    //   color: Colors.black,
                    //   size: 30,
                    // ),
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
