import 'package:agendoh/Bottombar/bottomnavigation.dart';
import 'package:agendoh/HomeScreen/HomePage.dart';
import 'package:agendoh/LoginScreen/loginScreen.dart';
import 'package:agendoh/ShopOwner/Shop_BottomNav/Shop_bottombar.dart';
import 'package:agendoh/Utils/Constants.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Registrationpages/RegisterScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  var Username = Constants.prefs.getString("Username");

  // var id = Constants.prefs.getString("ID");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Username == null ? LoginScreen() : Bottombar(),
  ));
}

// void main() {
//   runApp(const Agendoh());
// }

// class Agendoh extends StatelessWidget {
//   const Agendoh({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Agendoh',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: RegisterationScreen(),
//     );
//   }
// }
