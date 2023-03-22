import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Dr. Chris Frazier',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              CircleAvatar(
                                radius: 30,
                                child: Image.asset('images/ml_doctor.png'),
                              ),
                            ],
                          ),
                          const Text(
                            'CATARACT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_month_rounded,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '12-3-2023',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.timer,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text('10:00 AM',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    foregroundColor: Colors.black
                                  ),
                                    onPressed: () {}, child: Text('Cancel')),
                              ),SizedBox(width: 10),
                              Container(
                                width: 150,
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text('Cancel')),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
