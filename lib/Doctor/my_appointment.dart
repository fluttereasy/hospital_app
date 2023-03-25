import 'package:flutter/material.dart';

import '../APPOINTMENT TABS/PAST APPOINTMENT/past_appointment_screen.dart';
import '../APPOINTMENT TABS/Upcoming BLoc/upcoming_appointment_screen.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 18, left: 18),
                  child: const Text(
                    'Appointment',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(15),
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(20), // Creates border
                          color: Colors.blue[300]),
                      indicatorWeight: 5,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: const EdgeInsets.only(left: 10, right: 10),
                      // isScrollable: true,
                      tabs: const [
                        Tab(
                            child: Text(
                          'PAST',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                        Tab(
                          child: Text('Upcoming',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        )
                      ]),
                ),
                const Expanded(child: TabBarView(children: [Tab1(), Tab2()]))
              ],
            )),
      ),
    );
  }
}
