import 'package:agendoh/Appointmentspages/Addpayment_1.dart';
import 'package:agendoh/Appointmentspages/Choosedateslot.dart';
import 'package:agendoh/Bottombar/Favouritelist.dart';
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

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrole();
  }
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index

  final PageStorageBucket bucket = PageStorageBucket();

  late Widget currentScreen = Dashboard(""); // Our first view in viewport
  var abc;
  getrole() async {
    var x = await readsession("role");
    abc = x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: Colors.white60,
          height: 60,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (abc == "Store") ...[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Dashboard(
                              ""); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 25,
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              HomePage(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 25,
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Notifications(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            size: 25,
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (abc == "Store")
                    ...[]
                  else ...[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Favouritelist(
                              ""); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              size: 25,
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            T_Personalinfo(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 25,
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
