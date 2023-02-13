import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/OTP%20Directories/OtpVerifyScreen.dart';
import 'package:hospital_app/OTP%20Directories/otp_bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static String? numberForProfileScreen;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OtpServices otpServices = OtpServices();

    return BlocProvider(
      create: (context) => OtpBloc(),
      child: Scaffold(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
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
                            controller: mobileController,
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
                          BlocBuilder<OtpBloc, OtpState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                  onPressed: () {
                                    context.read<OtpBloc>().add(
                                        ButtonClickedEvent(
                                            mobileNumber:
                                                mobileController.text));
                                    OtpScreen.numberForProfileScreen =
                                        mobileController.text;
                                    print(OtpScreen.numberForProfileScreen);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OtpVerifyScreen()));
                                    if (state is OtpSentState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20,
                                                  horizontal: 100),
                                              backgroundColor: Colors.green,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                'OTP sent Successfully',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                                textAlign: TextAlign.center,
                                              )));
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
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
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
