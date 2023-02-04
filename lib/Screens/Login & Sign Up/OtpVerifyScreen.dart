import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:hospital_app/Screens/Dashboard/dashboard_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Verification',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
          const Text(
            "Please enter the verification code sent to 7982208767",
            style: TextStyle(
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
              print(output);
            },
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const NavigationBarScreen()));
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
    );
  }
}
