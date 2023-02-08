import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/Profile%20Screen/ProfileJsonModel/profileModel.dart';
import 'Profile Screen/profile_details_servcies.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController phoneController =
      TextEditingController(text: '9967931275');

  ProfileDetailsServices profileDetailsServices = ProfileDetailsServices();
  ProfileModel profileModel = ProfileModel();

  void getdetails() async {
    final details =
        await profileDetailsServices.getUserDetails(phoneController.text);
    print(details.dataInfo!.patientName);
    setState(() {
      profileModel = details;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                getdetails();
              },
              child: const Text('Tap')),
        ),
      ],
    ));
  }
}
