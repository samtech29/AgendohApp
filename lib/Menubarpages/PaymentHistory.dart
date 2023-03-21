import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentHistoty extends StatelessWidget {
  const PaymentHistoty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Payment History"),
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
                      "Shop Name",
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
                        'Groomer Specialist',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    trailing: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            print('Button Pressed');
                          },
                          child: Text("250.00"),
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
