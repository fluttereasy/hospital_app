import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/Notification/notification_screen.dart';
import 'package:hospital_app/Screens/Profile%20Screen/proile_screen.dart';
import '../../Doctor/HospitalServices/hospital_Services.dart';
import '../../Doctor/HospitalServices/hospital_model.dart';
import '../../Doctor/my_appointment.dart';
import '../Home/home_screen.dart';


class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const AppointmentScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: screens[currentIndex],
      bottomNavigationBar: GestureDetector(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                backgroundColor: Colors.grey,
                icon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                label: 'Appointment',
                backgroundColor: Colors.pink,
                icon: Icon(Icons.calendar_month)),
            BottomNavigationBarItem(
                label: 'Notification',
                backgroundColor: Colors.yellow,
                icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(
                label: 'Profile',
                backgroundColor: Colors.red,
                icon: Icon(Icons.person))
          ],
        ),
      ),
    );
  }
}
