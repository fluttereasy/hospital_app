import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Book Appointment'),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              height: 100,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search for Doctors',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      prefixIcon: const Icon(Icons.search_rounded)),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          child:
                              Image(image: AssetImage('images/ml_doctor.png')),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Darell Steward',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),SizedBox(height: 8,),
                            const Text(
                              '   General Practitioner',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined),
                                const SizedBox(width: 5),
                                const Text(
                                  '3 Years',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),const SizedBox(width: 10),
                                Container(
                                  height: 15,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/ml_like.png'))),
                                ),const Text('92 %',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),)
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
