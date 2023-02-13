import 'package:flutter/material.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  HospitalServices hospitalServices = HospitalServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder<List<HospitalModel>>(
                future: hospitalServices.getHospitalList(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                          child:
                              Text(snapshot.data![0].hospitalName.toString()));
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
