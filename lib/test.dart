import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'APPOINTMENT TABS/Upcoming BLoc/upcoming_appointment_model.dart';
import 'APPOINTMENT TABS/Upcoming BLoc/upcoming_appointment_services.dart';
import 'Constant/constant.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  UpcomingAppointmentServices upcomingAPpointment =
      UpcomingAppointmentServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  UpServices upservices = UpServices();
                  final data = upservices.upAppointment('7982208767');
                },
                child: Text('API')),
          )
        ],
      ),
    );
  }
}

class UpServices {
  Future upAppointment(String phoneNumber) async {
    String endPoint = 'UpComingPatientAppt?MObileNo=';
    try {
      print('inside try catch same screen');
      final response = await http
          .get(Uri.parse('${ConstantApi.baseUrl}$endPoint$phoneNumber'));

      final json = jsonDecode(response.body);
      print(json);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

class UpAppointmentModel {
  String? ok;
  List<String>? patient;
  Patient? name;
  UpAppointmentModel({this.ok, this.patient, this.name});
  factory UpAppointmentModel.fromJson(Map<String, dynamic> json) {
    return UpAppointmentModel(
        ok: json['OK'],
        patient: List<String>.from(json['patient']),
        name: json['patient']);
  }
}

class Patient2 {
  String? patientName;
  String? mObileNo;
  String? bookingDate;
  String? bookingTime;
  String? appDate;
  String? appTime;
  String? charge;
  String? chargeType;
  String? drName;
  String? dRID;

  Patient2(
      {this.patientName,
      this.mObileNo,
      this.bookingDate,
      this.bookingTime,
      this.appDate,
      this.appTime,
      this.charge,
      this.chargeType,
      this.drName,
      this.dRID});

  Patient2.fromJson(Map<String, dynamic> json) {
    patientName = json['PatientName'];
    mObileNo = json['MObileNo'];
    bookingDate = json['Booking_Date'];
    bookingTime = json['Booking_Time'];
    appDate = json['App_date'];
    appTime = json['App_Time'];
    charge = json['charge'];
    chargeType = json['ChargeType'];
    drName = json['Dr_Name'];
    dRID = json['DR_ID'];
  }
}
