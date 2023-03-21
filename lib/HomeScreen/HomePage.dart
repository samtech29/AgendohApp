import 'package:agendoh/Bottombar/bottomnavigation.dart';
import 'package:agendoh/Menubarpages/PaymentHistory.dart';
import 'package:agendoh/Utils/Constants.dart';
import 'package:agendoh/tabscreen/Allshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginScreen/loginScreen.dart';
import '../Menubar/Menubar.dart';
import '../Menubarpages/Custmorsupport.dart';

import '../Menubarpages/Settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../tabscreen/Cleaningservice.dart';
import '../tabscreen/Groomershop.dart';
import '../tabscreen/Hairdresser.dart';
import '../tabscreen/Nutritionist.dart';
import '../tabscreen/dentistshop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  Future readsession(var xyz) async {
    Constants.prefs = await SharedPreferences.getInstance();
    return Constants.prefs.getString(xyz);
  }
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  TextEditingController textController = TextEditingController();

  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 6,
      child: Scaffold(
        drawer: Menubar(""),
        appBar: AppBar(
          actions: [
            AnimSearchBar(
              color: Colors.blue,
              width: 220,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
              onSubmitted: (String) {},
            ),
            SizedBox(width: 10),
            InkWell(
              child: Icon(Icons.more_vert),
              onTap: () {
                print("click more");
              },
            ),
            SizedBox(width: 20)
          ],
          bottom: TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: [
              Column(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                    child: Text(
                      'All',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )),
                  SizedBox(
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/groomer.jpeg'),
                  )),
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Groomer",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/dentist.jpeg'),
                  )),
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Dentist",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/nutritionist.jpg'),
                  )),
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Nutritionist",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.c)))),
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Service",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/hairdresser.jpeg'),
                  )),
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Hair Dresser",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: AllShop()),
            Center(child: Groomershop()),
            Center(child: DentistShop()),
            Center(child: Nutritionist()),
            Center(child: Cleaningservice()),
            Center(child: Hairdresser())
          ],
        ),
      ),
    );
  }
}
