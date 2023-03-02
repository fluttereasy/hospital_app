import 'package:flutter/material.dart';
import 'package:hospital_app/Patient%20Details/patient_details_bloc.dart';
import 'package:hospital_app/Patient%20Details/patient_details_services.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

PatientDetailsServices2   patientDetailsServices2 = PatientDetailsServices2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestScreen'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
             patientDetailsServices2.postPatientDetails2('Sawan','Male', '20','123456789','sawan@mail.com','1000','PAID','1','1032');
          }, child: Text('API button'))
        ],
      ),
    );
  }
}
