import 'package:flutter/material.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/my_surgery_screen_today.dart';

import '../MY SURGERY/custom_date_surgery.dart';
import '../MY SURGERY/my_surgery_screen_tomorrow.dart';

class MySurgeryTabs extends StatefulWidget {
  const MySurgeryTabs({Key? key}) : super(key: key);

  @override
  State<MySurgeryTabs> createState() => _MySurgeryTabsState();
}

class _MySurgeryTabsState extends State<MySurgeryTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              title: const Text(
                'Surgery',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          color: Colors.teal.shade200),
                      indicatorWeight: 5,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: const EdgeInsets.only(left: 10, right: 10),
                      // isScrollable: true,
                      tabs: const [
                        Tab(
                          child: Text('Today',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        Tab(
                            child: Text(
                          'Tomorrow',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                        Tab(
                            child: Text(
                          'Custom',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ]),
                ),
                const Expanded(
                    child: TabBarView(children: [
                  MySurgeryToday(),
                  MySurgeryTomorrow(),
                  CustomDateSurgery()
                ]))
              ],
            )),
      ),
    );
  }
}
