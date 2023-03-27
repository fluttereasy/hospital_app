import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Department%20List/department_list.dart';
import 'package:hospital_app/Hospital_List/hospital_list.dart';
import 'package:hospital_app/Screens/Profile%20Screen/proile_screen.dart';
import '../../Doctor/find_doctors.dart';
import '../../EYE GAMES/eye_test_gridview_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Internet/internet_bloc.dart';
import '../../Internet/internet_states.dart';
import '../../OPTICAL/optical_bill_screen.dart';
import '../../OTP Directories/otp_screen.dart';
import '../Profile Screen/profile_bloc.dart';
import '../Profile Screen/profile_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showPopUp = false;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeOpen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()
        ..add(ProfileLoadingEvent(
            mobileNumber: OtpScreen.numberForProfileScreen.toString())),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, right: 10, left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        },
                        child: const CircleAvatar(
                          radius: 27,
                          backgroundImage: AssetImage('images/ml_doctor.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                        if (state is ProfileLoadingState) {
                          return const CircularProgressIndicator();
                        }
                        if (state is ProfileLoadedState) {
                          final userList = state.details;
                          return userList.dataInfo!.patientName != null
                              ? Text(
                                  userList.dataInfo!.patientName.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                )
                              : const SizedBox.shrink();
                        }
                        return const SizedBox.shrink();
                      })
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const SearchDoctors()));
                                  },
                                  child: Image.asset(
                                    'images/ml_dashboardClinicVisit.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                const Text('Appointment',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const OpticalScreen()));
                                  },
                                  child: Image.asset(
                                    'images/ml_covidSpecialist.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                const Text('Opticals',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/ml_dashboardPharmacy.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const Text('Pharmacy',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const EyeTestScreen()));
                                  },
                                  child: Image.asset(
                                    'images/ml_eyeSpecialist.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                const Text('Eye-Test',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) => popUp(context));
                                  },
                                  child: Image.asset(
                                    'images/ml_bloodTest.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                const Text('Blood Test',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'images/ml_dashboardHomeVisit.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const Text('Home Visit',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Top Hospitals',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const HospitalListScreen()));
                              },
                              child: const Text(
                                'View all >',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.asset(
                              'images/ml_tophospitalone.jpg',
                              height: 180,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                            Image.asset(
                              'images/ml_tophospitalTwo.jpeg',
                              height: 180,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                            Image.asset(
                              'images/ml_tophospitalone.jpg',
                              height: 180,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Departments',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const DepartmentList()));
                                },
                                child: const Text(
                                  'View all >',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_one.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_three.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_one.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_two.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_one.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_three.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_one.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/ml_department_two.png',
                                      height: 100,
                                    ),
                                    const Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      MultiBlocListener(listeners: [
                        BlocListener<InternetBLoc, InternetStates>(
                            listener: (context, state) {
                          if (state is InternetGainedState) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              elevation: 20,
                              duration: const Duration(milliseconds: 1500),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(10),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Internet Connected',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              backgroundColor: Colors.green,
                            ));
                          }
                        }),
                        BlocListener<InternetBLoc, InternetStates>(
                            listener: (context, state) {
                          if (state is InternetLostState) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(milliseconds: 1500),
                              elevation: 20,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(10),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'No Internet Connection',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.dangerous,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }),
                      ], child: const Text('')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkFirstTimeOpen() async {
    final prefs = await SharedPreferences.getInstance();
    final firstTimeOpen = prefs.getBool('first_time_open') ?? true;
    if (firstTimeOpen) {
      await prefs.setBool('first_time_open', false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.lightBlue[100],
              clipBehavior: Clip.antiAliasWithSaveLayer,
              content: SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upcoming Appointment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.red),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Image.asset('images/ml_doctor.png'),
                      ),
                      title: const Text(
                        'Doctor Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        '04-Mar-2024',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Text(
                        '3:00 PM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Direction')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Contact')),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.of(context).pop(false);
                    //     },
                    //     child: const Text('Cancel')),
                  ],
                ),
              ],
            );
          },
        );
      });
    }
  }
}
