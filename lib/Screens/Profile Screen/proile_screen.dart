import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Screens/Login%20&%20Sign%20Up/login_screen.dart';
import 'package:hospital_app/Screens/Notification/notification_settings.dart';
import 'package:hospital_app/Screens/Profile%20Screen/edit_profile_screen.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_bloc.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_details_servcies.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_state.dart';
import 'package:hospital_app/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../OTP Directories/otp_screen.dart';
import 'ProfileJsonModel/profileModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void logOut() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
  }

  ProfileDetailsServices profileDetailsServices = ProfileDetailsServices();
  ProfileModel profileModel = ProfileModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()
        ..add(ProfileLoadingEvent(
            mobileNumber: OtpScreen.numberForProfileScreen.toString())),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              'Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 105,
                  child: Stack(
                    children: const [
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('images/ml_doctor.png'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        : const SizedBox.shrink();
                  }
                  if (state is ProfileFailedState) {
                    return const Text(
                      'Failed to Load Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 5),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoadedState) {
                    final userList = state.details;
                    return userList.dataInfo!.mobileNo != null
                        ? Text(
                            userList.dataInfo!.mobileNo.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          )
                        : const SizedBox.shrink();
                  }
                  return Container();
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        },
                        leading: const Icon(
                          Icons.person_outline,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Edit Profile',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.wallet,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Payment',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const NotificationSettings()));
                        },
                        leading: const Icon(
                          Icons.notifications,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Notification',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => TestScreen()));
                        },
                        leading: const Icon(
                          Icons.language_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Language',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.help_center_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Help Center',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.person_add_alt_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Invite Friends',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title:
                                  const Text("Do you really want to logout ??"),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    ElevatedButton(
                                      onPressed: () {
                                        logOut();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const LoginScreens()),
                                            (route) => false);
                                      },
                                      child: const Text(
                                        'yes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.logout_outlined,
                          size: 25,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
