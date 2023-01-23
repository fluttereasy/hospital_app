import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/dashboard_screen.dart';
import 'package:hospital_app/Screens/register_screen.dart';
import 'package:hospital_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
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
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20.0))),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text('Welcome',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: 'Your Name',
                                prefixIcon: Icon(Icons.type_specimen)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'Enter Mobile Number',
                                prefixIcon: Icon(Icons.mobile_friendly)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: 'Your Password',
                                prefixIcon: Icon(Icons.lock)),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.right,
                                  ))),
                          const SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                //saving the data in sharedPreference variable after the Login button pressed
                                var sharedpref =
                                    await SharedPreferences.getInstance();
                                sharedpref.setBool(
                                    SplashScreenState.KEYLOGIN, true);
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const NavigationBarScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0)),
                                width: double.infinity,
                                height: 50,
                                child: const Center(
                                    child: Text(
                                  'Login',
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                              child: const Text(
                                "Don't have an account ??",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
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
      ),
    );
  }
}
