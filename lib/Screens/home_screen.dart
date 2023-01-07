import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                      radius: 28,
                      child: ClipOval(
                        child: Image(
                          image: NetworkImage(
                              'https://kalingatv.com/wp-content/uploads/2017/04/Virat-Kohli-RCB.jpg'),
                        ),
                      )),
                  SizedBox(width: 5),
                  Text(
                    'Virat Kohli',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                height: 170,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/ml_dashboardClinicVisit.png'))),
                          ),
                          const Text(
                            'Appointment',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 45,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/ml_covidSpecialist.png'))),
                          ),
                          const Text(
                            'Covid-19',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/ml_dashboardHomeVisit.png'))),
                          ),
                          const Text(
                            'Home Visit',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 45,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/ml_dashboardPharmacy.png'))),
                          ),
                          const Text(
                            'Pharmacy',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/ml_eyeSpecialist.png'))),
                          ),
                          const Text(
                            'Eye Consult',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 45,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/ml_bloodTest.png'))),
                          ),
                          const Text(
                            'Eye Consult',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
