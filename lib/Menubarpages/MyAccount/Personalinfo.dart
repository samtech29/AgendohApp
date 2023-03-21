// import 'package:agendoh/Menubarpages/MyAccount/EditProfile.dart';
// import 'package:agendoh/inc/Config.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     title: "Personal info",
//     theme: ThemeData.dark(),
//     darkTheme: ThemeData.dark(),
//     // home: personalinfo(),
//   ));
// }

// class Personalinfo extends StatefulWidget {
//   const Personalinfo({super.key});

//   @override
//   State<Personalinfo> createState() => _PersonalinfoState();
// }

// class _PersonalinfoState extends State<Personalinfo> {
//   var url = (Apis.baseurl + "T_A_Users_ReadAPI.php");
//   var data;
//   bool showPassword = false;

//   void imagePickerOption() {
//     Get.bottomSheet(
//       SingleChildScrollView(),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   getdata() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     var res =
//         await http.post(Uri.parse(url), body: {"single": '1', "myid": 'id'});
//     data = jsonDecode(res.body);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Personal Info"),
//         centerTitle: true,
//         // Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0,
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back, color: Colors.white),
//         //   onPressed: () => Navigator.of(context).pop(),
//         // ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.edit,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => EditProfile()));
//             },
//           )
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 2, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                         width: 2,
//                         color: Theme.of(context).scaffoldBackgroundColor),
//                     boxShadow: [
//                       BoxShadow(
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                           color: Colors.black.withOpacity(0.1),
//                           offset: Offset(0, 10))
//                     ],
//                     shape: BoxShape.circle,
//                   ),
//                   child: ClipOval(
//                       child: Image.network(
//                     'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
//                     fit: BoxFit.cover,
//                     height: 100,
//                     width: 100,
//                   )),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               buildTextField("First Name", "Person Name", false),
//               buildTextField("Last Name", "Person Last Name", false),
//               buildTextField("E-mail", "Demo123@gmail.com", false),
//               buildTextField("Phone", "0123456789", false),
//               buildTextField("Location", "New York, US", false),
//               SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25.0),
//       child: TextField(
//           obscureText: isPasswordTextField ? showPassword : false,
//           decoration: InputDecoration(
//               suffixIcon: isPasswordTextField
//                   ? IconButton(
//                       onPressed: () {
//                         setState(() {
//                           showPassword = !showPassword;
//                         });
//                       },
//                       icon: Icon(
//                         Icons.remove_red_eye,
//                         color: Colors.white,
//                       ),
//                     )
//                   : null,
//               contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(
//                   color: Colors.blue,
//                 ),
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: BorderSide(color: Colors.blue)),
//               labelText: labelText,
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               hintText: placeholder,
//               hintStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.black,
//               )),
//           enabled: false),
//     );
//   }
// }
