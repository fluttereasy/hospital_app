import 'package:flutter/material.dart';

import 'Screens/Appointment Timing/Timing SLots/appopintment_services.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  AppointmentServices appointmentServices = AppointmentServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                appointmentServices.getAppointmentTiming(
                    '2306', '1', '03-03-2023');
              },
              child: const Text('APi Button'))
        ],
      ),
    );
  }
}
