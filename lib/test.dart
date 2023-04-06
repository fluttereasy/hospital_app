import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Doctor Login/my_opd_appointment.dart';
import 'Doctor Login/my_surgery.dart';
import 'Doctor Login/waiting_list.dart';

class DoctorDashBoard extends StatefulWidget {
  const DoctorDashBoard({Key? key}) : super(key: key);

  @override
  State<DoctorDashBoard> createState() => _DoctorDashBoardState();
}

class _DoctorDashBoardState extends State<DoctorDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        leading: Container(
          margin: const EdgeInsets.only(left: 3),
          padding: const EdgeInsets.all(5),
          child: const CircleAvatar(
            child: Image(image: AssetImage('images/Image.png')),
          ),
        ),
        title: const Text(
          'Doctor Name',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  'Hello,',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
                Text(
                  ' Doctor',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const WaitingListScreen()));
                    },
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.blueGrey.shade100, width: 5.0)),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                            'images/waitinglist.jpg',
                            height: 90,
                            width: 140,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Waitlist',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const OpdAppointment()));
                    },
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.blueGrey.shade100, width: 5.0)),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                            'images/opd.jpg',
                            height: 90,
                            width: 140,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'My OPD Appointment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const MySurgery()));
              },
              child: Container(
                height: 140,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: Colors.blueGrey.shade100, width: 5.0)),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Image.asset(
                      'images/opd.jpg',
                      height: 90,
                      width: 140,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'My surgeries',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
