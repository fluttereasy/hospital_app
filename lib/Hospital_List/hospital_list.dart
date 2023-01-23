import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Hospital_List/hospital_appointment_screen.dart';

class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({Key? key}) : super(key: key);

  @override
  State<HospitalListScreen> createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Hospitals List'),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            color: Colors.blue,
            height: 100,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search for Hospitals',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    prefixIcon: const Icon(Icons.search_rounded)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: ((context, index) => Card(
                          elevation: 3,
                          child: SizedBox(
                            height: 265,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    image: const DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            'images/ml_tophospitalone.jpg')),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(20),
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  child: const Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const Text(
                                            'Johns Hokins Hospital',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          const Text(
                                            'New York, NY',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                '4.8 (476 Reviews)',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const Expanded(
                                                  child: SizedBox(width: 5)),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>const HospitalAppointmentScreen()));
                                                  },
                                                  child:
                                                      const Text('Details >'))
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )))),
          )
        ]));
  }
}
