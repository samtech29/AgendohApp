import 'package:agendoh/Appointmentspages/Addpayment_1.dart';
import 'package:agendoh/Appointmentspages/Choosedateslot.dart';
import 'package:agendoh/Bottombar/bottomnavigation.dart';
import 'package:agendoh/HomeScreen/HomePage.dart';
import 'package:agendoh/Menubarpages/ForgotPassword.dart';
import 'package:agendoh/Menubarpages/MyAccount/EditProfile.dart';
import 'package:agendoh/Menubarpages/MyAccount/Personalinfo.dart';
import 'package:agendoh/Menubarpages/Notification.dart';
import 'package:agendoh/ShopOwner/Dashboard.dart';
import 'package:agendoh/ShopOwner/Dashboardpages/Appointmentlist.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:agendoh/tabscreen/Groomershop.dart';
import 'package:agendoh/tabscreen/Hairdresser.dart';
import 'package:agendoh/tabscreen/Nutritionist.dart';
import 'package:agendoh/tabscreen/dentistshop.dart';
import 'package:agendoh/testpages/T_Editprofile.dart';
import 'package:agendoh/testpages/T_Personalinfo.dart';
import 'package:flutter/material.dart';

class Shop_Bottombar extends StatefulWidget {
  @override
  _Shop_BottombarState createState() => _Shop_BottombarState();
}

class _Shop_BottombarState extends State<Shop_Bottombar> {
  // Properties & Variables needed

  // to keep track of active tab index

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Bottombar();
  }
}
