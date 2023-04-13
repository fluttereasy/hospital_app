import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor%20Login/DOCTOR%20DASHBOARD/doctor_dashBoard.dart';
import 'package:hospital_app/Internet/internet_bloc.dart';
import 'package:hospital_app/OTP%20Directories/OtpVerifyScreen.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:hospital_app/safexpay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Internet/internet_states.dart';
import 'SAFEXPAY LIBRARY/constants/merchant_constants.dart';
import 'SAFEXPAY LIBRARY/constants/strings.dart';
import 'SHAREDPREFERENCE CONSTANT/shared_preference.dart';
import 'Screens/Login & Sign Up/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  ReceivePort receivePort = ReceivePort();

  //downloading callback function to connect the downloading screen from main.dart screen
  static downloadingCallBack(id, status, progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName('downloading');
    sendPort?.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(receivePort.sendPort, 'downloading');
    receivePort.listen((message) {});
    FlutterDownloader.registerCallback(downloadingCallBack);
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

  checkOtpNumber() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final number = sp.getString('MOBILENUMBER');
    if (number == null) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => OtpScreen()));
    }
    if (number != null) {
      OtpScreen.numberForProfileScreen = sp.getString('MOBILENUMBER');
      print(sp.getBool(SharedPreferenceData.checkIfDoctor));

      bool? doctoScreen = sp.getBool(SharedPreferenceData.checkIfDoctor);
      print(doctoScreen);
      if (doctoScreen == true) {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const DoctorDashBoard()));
      } else {
        print(number);
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => const NavigationBarScreen()));
      }
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
