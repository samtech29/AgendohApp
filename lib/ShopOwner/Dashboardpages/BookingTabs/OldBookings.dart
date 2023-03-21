import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OldBooking extends StatelessWidget {
  const OldBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
                      "Person Name",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            // SizedBox(width: 50),
                            Row(
                              children: [
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '/ 30 Yr',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'DD/MM/YYYY 00:00:00 Am ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            print('Button Pressed');
                          },
                          child: Text("Viewed"),
                        ),
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
