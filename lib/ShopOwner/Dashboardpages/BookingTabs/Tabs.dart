import 'package:agendoh/ShopOwner/Dashboardpages/BookingTabs/OldBookings.dart';
import 'package:agendoh/ShopOwner/Dashboardpages/BookingTabs/TodayBooking.dart';

import 'package:flutter/material.dart';

class BookingTabs extends StatefulWidget {
  const BookingTabs({super.key});

  @override
  State<BookingTabs> createState() => _BookingTabsState();
}

class _BookingTabsState extends State<BookingTabs> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Booking History"),
          centerTitle: true,
          actions: [],
          bottom: TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[800],
            tabs: [
              Column(
                children: [
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Today",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: Center(
                      child: Text(
                        "Old",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: TodayBooking()),
            Center(child: OldBooking()),
          ],
        ),
      ),
    );
  }
}
