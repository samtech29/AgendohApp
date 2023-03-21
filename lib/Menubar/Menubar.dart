import 'package:agendoh/Menubarpages/MyAccount/EditProfile.dart';
import 'package:agendoh/Menubarpages/MyAccount/Personalinfo.dart';
import 'package:agendoh/Menubarpages/Notification.dart';
import 'package:agendoh/Message/chatScreen.dart';
import 'package:agendoh/Message/messagelist.dart';
import 'package:agendoh/ShopOwner/Dashboard.dart';
import 'package:agendoh/ShopOwner/Menubar/ShopMenu.dart';
import 'package:agendoh/ShopOwner/Shop_BottomNav/Shop_bottombar.dart';
import 'package:agendoh/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginScreen/loginScreen.dart';
import '../Menubarpages/Custmorsupport.dart';

import '../Menubarpages/PaymentHistory.dart';
import '../Menubarpages/Settings.dart';

class Menubar extends StatefulWidget {
  final String ID;
  const Menubar(this.ID, {super.key});

  @override
  State<Menubar> createState() => _MenubarState();

  Future readsession(var xyz) async {
    Constants.prefs = await SharedPreferences.getInstance();
    return Constants.prefs.getString(xyz);
  }
}

class _MenubarState extends State<Menubar> {
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Personalinfo()));
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
          ListTile(
            leading: Icon(
              Icons.swap_calls,
            ),
            title: const Text('User Change'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shop_Bottombar()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: const Text('Logout'),
            onTap: () {
              Constants.prefs.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen())));
            },
          ),
        ],
      ),
    ));
  }
}
