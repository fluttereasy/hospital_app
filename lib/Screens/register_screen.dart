import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/login_screen.dart';
import 'dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int roleofUser = -1;

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();
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
                        BorderRadius.only(topRight: Radius.circular(50.0))),
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
                          const Text('Register',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 15,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Doctor",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Radio(
                                value: 1,
                                groupValue: roleofUser,
                                onChanged: (value) {
                                  setState(() {
                                    roleofUser = value!;
                                  });
                                },
                                activeColor: Colors.red,
                              ),
                              const Text(
                                "Patient",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Radio(
                                value: 2,
                                groupValue: roleofUser,
                                onChanged: (value) {
                                  setState(() {
                                    roleofUser = value!;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
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
                                  'Register',
                                  style: TextStyle(
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
                                            const LoginScreen()));
                              },
                              child: const Text(
                                'Already have an account? Login',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //TODO
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 35,
                                  width: 80,
                                  child: const Image(
                                      image:
                                          AssetImage('images/ml_google.png')),
                                ),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  //TODO
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 35,
                                  width: 85,
                                  child: const Image(
                                      image: AssetImage('images/ml_ios.png')),
                                ),
                              )
                            ],
                          )
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
