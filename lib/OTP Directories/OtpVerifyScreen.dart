import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:hospital_app/Doctor%20Login/Doctor%20Login%20Details/doctor_login_bloc.dart';
import 'package:hospital_app/Doctor%20Login/Doctor%20Login%20Details/doctor_login_model.dart';
import 'package:hospital_app/OTP%20Directories/otp_bloc.dart';
import 'package:hospital_app/SHAREDPREFERENCE%20CONSTANT/shared_preference.dart';
import 'package:hospital_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:hospital_app/OTP%20Directories/otp_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Doctor Login/DOCTOR DASHBOARD/doctor_dashBoard.dart';
import 'otp_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var doctorProfile = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpBloc(),
        ),
        BlocProvider(
          create: (context) => DoctorLoginBloc()
            ..add(DoctorLoginFetch(
                phoneNumber: OtpScreen.numberForProfileScreen.toString())),
        ),
      ],
      child: BlocListener<DoctorLoginBloc, DoctorLoginState>(
        listener: (context, state) {
          if (state is DoctorLoginLoadedState) {
            final data = state.isDoctor;
            if (data[0]['UserType'].toString() == 'Doctor') {
              doctorProfile = true;
            } else {
              print(doctorProfile);
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Verification',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Verification Code",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please enter the verification code sent to ${OtpScreen.numberForProfileScreen}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 14,
              ),
              PinCodeFields(
                controller: otpController,
                length: 6,
                fieldBorderStyle: FieldBorderStyle.square,
                fieldHeight: 70.0,
                fieldWidth: 130.0,
                borderRadius: BorderRadius.circular(20.0),
                onComplete: (output) {
                  //todo
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () async {
                    if (otpController.text == OtpServices.getOtp.toString()) {
                      if (doctorProfile == true) {
                        // here we are checking if the login number belongs to a doctor if yes we will navigate the user to doctor dashBoard
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.setBool(SharedPreferenceData.checkIfDoctor, doctorProfile);
                        print(sp.getBool(SharedPreferenceData.checkIfDoctor));
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DoctorDashBoard()));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const NavigationBarScreen()));
                      }
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString('MOBILENUMBER',
                          OtpScreen.numberForProfileScreen.toString());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          elevation: 20,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 130),
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Incorrect OTP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            textAlign: TextAlign.center,
                          )));
                    }
                  },
                  child: const SizedBox(
                    height: 50,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(fontSize: 20, letterSpacing: 2),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
