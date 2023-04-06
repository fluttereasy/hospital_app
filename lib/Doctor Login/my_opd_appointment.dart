import 'package:flutter/material.dart';

class OpdAppointment extends StatefulWidget {
  const OpdAppointment({Key? key}) : super(key: key);

  @override
  State<OpdAppointment> createState() => _OpdAppointmentState();
}

class _OpdAppointmentState extends State<OpdAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'OPD Apppointment',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.blueGrey.shade50, width: 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Ram Sharma',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Cataract',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('Surgery eye'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 24,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.teal.shade200)),
                            child: const Center(
                              child: Text(
                                'Wed 23',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 24,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.teal.shade200)),
                            child: const Center(
                              child: Text(
                                '03:00 PM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rs- 5000',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
        ));
  }
}
