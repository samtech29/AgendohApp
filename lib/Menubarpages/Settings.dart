// import 'package:agendoh/Menubarpages/ForgotPassword.dart';
// import 'package:agendoh/Menubarpages/Notification.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'PaymentHistory.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: Text("Settings"),
//         //brightness: Brightness.light,
//         // backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 65,
//             color: Colors.white,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       "Notification",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Notifications()));
//                       },
//                       icon: Icon(
//                         Icons.navigate_next,
//                         size: 30,
//                       ),
//                       color: Colors.black,
//                     ),
//                     leading: Icon(
//                       Icons.notifications,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: 65,
//             color: Colors.white,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       "Change Password",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ForgotPassword()));
//                       },
//                       icon: Icon(
//                         Icons.navigate_next,
//                         size: 30,
//                       ),
//                       color: Colors.black,
//                     ),
//                     leading: Icon(
//                       Icons.password,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
