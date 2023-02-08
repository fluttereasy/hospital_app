import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/Login%20&%20Sign%20Up/otp_services.dart';
import 'OtpVerifyScreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static TextEditingController mobileController = TextEditingController();

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    OtpServices otpServices = OtpServices();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Center(
            child: Container(
                color: Colors.blue,
                height: 200,
                width: 200,
                child: const Image(
                    image: AssetImage('images/ml_department_one.png'))),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0))),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Welcome',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: OtpScreen.mobileController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter Mobile Number',
                              prefixIcon: Icon(Icons.mobile_friendly)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              //checking the phone number length is correct or not
                              if (OtpScreen.mobileController.text.length ==
                                  10) {
                                //sending otp from here
                                OtpServices.sendOtp(
                                    OtpScreen.mobileController.text);
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const OtpVerifyScreen()));

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 100),
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          'OTP sent Successfully',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )));
                              } else if (OtpServices.otpNotSent != null) {
                                const SnackBar(
                                    backgroundColor: Colors.blue,
                                    elevation: 20,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 80),
                                    content:
                                        Text('OTP not sent please try again'));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        elevation: 20,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 80),
                                        content:
                                            Text('Please check the Number')));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0)),
                              width: double.infinity,
                              height: 50,
                              child: const Center(
                                  child: Text(
                                'Get OTP',
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
