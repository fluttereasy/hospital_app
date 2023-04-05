import 'package:flutter/material.dart';

class DoctorDashBoard extends StatefulWidget {
  const DoctorDashBoard({Key? key}) : super(key: key);

  @override
  State<DoctorDashBoard> createState() => _DoctorDashBoardState();
}

class _DoctorDashBoardState extends State<DoctorDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: CircleAvatar(
          child: Image.asset('images/ml_doctor.png'),
        ),
        title:Text('Doctor Name'),
      ),
    );
  }
}
