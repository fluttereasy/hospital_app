import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor%20Login/Doctor%20Login%20Details/doctor_login_bloc.dart';
import 'package:hospital_app/Doctor%20Login/WaitList/waitlist_services.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Doctor Login Appointment Tabs/doctor_login_appoinment_tab_screen.dart';
import '../MY SURGERY/suregry_servies.dart';
import '../SurgeryTab/surgery_tab_screen.dart';
import '../WaitList/waitlist_screen.dart';

class DoctorDashBoard extends StatefulWidget {
  const DoctorDashBoard({Key? key}) : super(key: key);

  static String? doctorId;
  @override
  State<DoctorDashBoard> createState() => _DoctorDashBoardState();
}

class _DoctorDashBoardState extends State<DoctorDashBoard> {
  WaitlistServices waitlistServices = WaitlistServices();
  SurgryServices surgryServices = SurgryServices();
  String? doctorName;

  void logOut() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    DoctorDashBoard.doctorId;
  }

  @override
  Widget build(BuildContext context) {
    print(OtpScreen.numberForProfileScreen);
    return BlocProvider(
      create: (context) =>
          DoctorLoginBloc()..add(DoctorLoginFetch(phoneNumber: '8005235097')),
      child: BlocBuilder<DoctorLoginBloc, DoctorLoginState>(
        builder: (context, state) {
          if (state is DoctorLoginLoadingState) {
            print('loading');
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DoctorLoginLoadedState) {
            final doctoroginData = state.isDoctor;
            doctorName = doctoroginData[0]['PatientName'];
            DoctorDashBoard.doctorId = doctoroginData[0]['PatientCode'];
            print(DoctorDashBoard.doctorId);
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              actions: [
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: InkWell(
                                onTap: () {
                                  logOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const OtpScreen()),
                                      (route) => false);
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.teal,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Logout',
                                      selectionColor: Colors.red,
                                    )
                                  ],
                                ),
                              ))
                        ])
              ],
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.only(left: 3),
                padding: const EdgeInsets.all(5),
                child: const CircleAvatar(
                  child: Image(image: AssetImage('images/Image.png')),
                ),
              ),
              title: Text(
                doctorName.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Hello,',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' Doctor',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => WaitingListScreen(
                                          doctorName: doctorName.toString(),
                                        )));
                          },
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: Colors.blueGrey.shade100,
                                    width: 5.0)),
                            child: Column(
                              children: [
                                const SizedBox(height: 0),
                                Image.asset(
                                  'images/waitlist.png',
                                  height: 95,
                                  width: 140,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Waitlist',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const DoctorLoginAppointment()));
                          },
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: Colors.blueGrey.shade100,
                                    width: 5.0)),
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                Image.asset(
                                  'images/doctor_login_appointment.png',
                                  height: 90,
                                  width: 140,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'My OPD Appointment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const MySurgeryTabs()));
                    },
                    child: Container(
                      height: 140,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.blueGrey.shade100, width: 5.0)),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Image.asset(
                            'images/surgery.png',
                            height: 90,
                            width: 140,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'My surgeries',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
