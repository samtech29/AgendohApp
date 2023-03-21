import 'dart:convert';

import 'package:agendoh/inc/Config.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var readurl = Apis.baseurl + 'T_A_Users_ReadAPI.php';
  var readdata;

  getdata() async {
    var res = await http.post(Uri.parse(readurl),
        body: {"single": '1', "myid": await readsession("id")});
    readdata = jsonDecode(res.body);
    print(readdata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Customer Support"),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                                height: 130,
                                child: Card(
                                    child: Image.asset("assets/customer.png"))),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "Contact Us",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Container(
                            height: 65,
                            color: Colors.white,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text(
                                        readdata[0]["Phone_Number"],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),

                                      //trailing:IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next,size: 30,),color: Colors.black,),
                                      leading: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.call,
                                          color: Colors.blue,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 65,
                            color: Colors.white,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text(
                                        readdata[0]["Email"],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),

                                      //trailing:IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next,size: 30,),color: Colors.black,),
                                      leading: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.message,
                                          color: Colors.amber,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
