import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Internet/internet_bloc.dart';
import 'package:hospital_app/OTP%20Directories/OtpVerifyScreen.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:hospital_app/safexpay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Internet/internet_states.dart';
import 'SAFEXPAY LIBRARY/constants/merchant_constants.dart';
import 'SAFEXPAY LIBRARY/constants/strings.dart';
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
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    MerchantConstants.setDetails(
        mId: '202209050002',
        mKey: 'zEjxm6Km1Y1lNxpnIVybKbWCdPqya7Bfn6zjwZO06MM=',
        aggId: 'Paygate',
        environment: Environment.TEST); //Environment.PRODUCTION
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await Safexpay.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
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

  // void whereTOGO() async {
  //   var sharedPref = await SharedPreferences.getInstance();
  //
  //   var isLoggedIn = sharedPref.getBool(KEYLOGIN);
  //
  //   Timer(const Duration(seconds: 2), () {
  //     if (isLoggedIn != null) {
  //       if (isLoggedIn) {
  //         Navigator.pushReplacement(
  //             context,
  //             CupertinoPageRoute(
  //                 builder: (context) => const NavigationBarScreen()));
  //       } else {
  //         Navigator.pushReplacement(context,
  //             CupertinoPageRoute(builder: (context) => const LoginScreens()));
  //       }
  //     } else {
  //       Navigator.pushReplacement(context,
  //           CupertinoPageRoute(builder: (context) => const LoginScreens()));
  //     }
  //   });
  // }

  checkOtpNumber() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final number = sp.getString('MOBILENUMBER');
    if (number==null) {
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => OtpScreen()));
    } if(number!=null){
      OtpScreen.numberForProfileScreen = sp.getString('MOBILENUMBER');
      print(number);
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => NavigationBarScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkOtpNumber();
    // whereTOGO();
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
