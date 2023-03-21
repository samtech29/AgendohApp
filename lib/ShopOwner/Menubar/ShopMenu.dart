import 'package:agendoh/Bottombar/bottomnavigation.dart';
import 'package:agendoh/HomeScreen/HomePage.dart';
import 'package:agendoh/LoginScreen/loginScreen.dart';
import 'package:agendoh/Menubarpages/Custmorsupport.dart';
import 'package:agendoh/Menubarpages/MyAccount/EditProfile.dart';
import 'package:agendoh/Menubarpages/MyAccount/Personalinfo.dart';
import 'package:agendoh/Menubarpages/Notification.dart';
import 'package:agendoh/Menubarpages/PaymentHistory.dart';
import 'package:agendoh/Message/chatScreen.dart';
import 'package:agendoh/Message/messagelist.dart';
import 'package:agendoh/ShopOwner/Dashboard.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopMenubar extends StatefulWidget {
  final String ID;
  const ShopMenubar(this.ID, {super.key});

  @override
  State<ShopMenubar> createState() => _ShopMenubarState();
}

class _ShopMenubarState extends State<ShopMenubar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.grey[200],
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 50),
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title:
                const Text('Account', style: TextStyle(color: Colors.black87)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
            ),
            title: const Text('Payment History'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentHistoty()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
            ),
            title: const Text('Notification'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //   ),
          //   title: const Text('Setting'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SettingsPage()));
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.call,
            ),
            title: const Text('Customer Support'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerSupport()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.message,
            ),
            title: const Text('Message'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Messagelist(widget.ID)));
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.swap_calls,
          //   ),
          //   title: const Text('Shop Owner'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Notifications()));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.swap_calls,
          //   ),
          //   title: const Text('Costumer'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Bottombar()));
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    ));
  }
}
