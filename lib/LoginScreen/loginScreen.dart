import 'package:agendoh/Bottombar/bottomnavigation.dart';
import 'package:agendoh/Menubarpages/ForgotPassword.dart';
import 'package:agendoh/Registrationpages/RegisterScreen.dart';
import 'package:agendoh/ShopOwner/Dashboard.dart';
import 'package:agendoh/Utils/Constants.dart';
import 'package:agendoh/inc/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../HomeScreen/HomePage.dart';
import '../ShopOwner/Shop_BottomNav/Shop_bottombar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Username = TextEditingController();
  final Password = TextEditingController();

  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void validateandsave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      getdata();
      setState(() {});
    } else {
      print('Form is invalid');
    }
  }

  getdata() async {
    var res = await http.post(Uri.parse(Apis.baseurl + 'T_Login.php'), body: {
      "Username": Username.text,
      "Password": Password.text,
    });
    data = jsonDecode(res.body);
    print(data);
    if (data['result'] == "Success") {
      // var myid = data['ID'];

      Fluttertoast.showToast(
          msg: "you are logged in successfully",
          backgroundColor: Colors.green,
          timeInSecForIosWeb: 6,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white);

      Constants.prefs.setString("Username", Username.text);
      Constants.prefs.setString("id", data["id"]);
      Constants.prefs.setString("role", data["role"]);

      if (data['role'] == "Store") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Shop_Bottombar(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Bottombar(),
            ));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Username and Password is invalid",
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.red,
          gravity: ToastGravity.TOP,
          textColor: Colors.white);
    }

    print(data);
    print(Username.text);
    print(Password.text);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // brightness: Brightness.light,

        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       size: 20,
        //       color: Colors.white,
        //     )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 130,
                          child: Image.asset("assets/agendohh.png"),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be blank";
                                } else {
                                  'null';
                                }
                              },
                              controller: Username,
                              decoration: InputDecoration(
                                // hintText: "First Name",
                                labelText: "Enter User Name",
                                labelStyle: TextStyle(color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.blue)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be blank";
                                } else {
                                  'null';
                                }
                              },
                              controller: Password,
                              obscureText: true,
                              decoration: InputDecoration(
                                // hintText: "First Name",
                                labelText: "Enter Password",
                                labelStyle: TextStyle(color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.blue)),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(120, 8, 0, 10),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()));
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 40,
                          onPressed: () async {
                            validateandsave();
                          },
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont have an account?"),
                        InkWell(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegisterationScreen()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
          // Widget makeInput({labelText,obsureText = false}){
          //   return Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(labelText,style:TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.w400,
          //         color: Colors.black87
          //       ),),
          //       SizedBox(height: 5,),
          //       TextField(
          //         obscureText: obsureText,
          //         decoration: InputDecoration(
          //           // hintText: "First Name",
          //           // labelText: "jai ho",
          //           contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          //           enabledBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(20),
          //             borderSide: BorderSide(
          //               color:Colors.blue,
          //             ),
          //           ),
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(20),
          //             borderSide: BorderSide(color: Colors.blue)
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: 30,)

          //     ],
          //   );
          // }