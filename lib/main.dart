import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Internet/internet_bloc.dart';
import 'package:hospital_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Internet/internet_states.dart';
import 'Screens/Login & Sign Up/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBLoc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------//

//SplashScreen code is here

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";

  //Function whereTOGO() to check if user is login or not using SharedPreference

  void whereTOGO() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => const NavigationBarScreen()));
        } else {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const LoginScreen()));
        }
      } else {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    whereTOGO();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
