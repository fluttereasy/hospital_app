import 'package:flutter/material.dart';
import 'package:hospital_app/Doctor/DoctorServices/doctor_services.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';

import '../Doctor/HospitalServices/hospital_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  DoctorServices doctorServices = DoctorServices();
  List<String> loadedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                doctorServices.getDoctorList(1);
              },
              child: Text('Tap'))
        ],
      ),
    );
  }
}
