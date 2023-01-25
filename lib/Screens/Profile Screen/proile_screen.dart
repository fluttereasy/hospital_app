import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_app/Payment/payment_connected.dart';
import 'package:hospital_app/Screens/Notification/notification_settings.dart';
import 'package:hospital_app/Screens/Profile%20Screen/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
                  // SizedBox(
                  //   width: 110,
                  //   height: 90,
                  //   child: Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: InkWell(
                  //       onTap: () {
                  //         //todo
                  //       },
                  //       child: Container(
                  //           decoration: BoxDecoration(
                  //               color: Colors.blue,
                  //               borderRadius: BorderRadius.circular(5.0)),
                  //           child: const Icon(
                  //             Icons.edit,
                  //             color: Colors.white,
                  //           )),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          const Text(
            'Andrew Ainsley',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5),
          const Text(
            '+91 79822867743',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
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
                              builder: (context) => const EditProfileScreen()));
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
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> const PaymentConnected()));
                    },
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
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> const NotificationSettings()));
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
                  const ListTile(
                    leading: Icon(
                      Icons.language_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                    title: Text(
                      'Language',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.help_center_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                    title: Text(
                      'Help Center',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
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
                  const ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      size: 25,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
