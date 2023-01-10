import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/notification_screen.dart';
import 'package:hospital_app/Screens/proile_screen.dart';
import 'apppointment_screen.dart';
import 'home_screen.dart';

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
          onTap: (index) => setState(() => currentIndex = index),
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
                label: 'Profile',
                backgroundColor: Colors.yellow,
                icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(
                label: 'Exit',
                backgroundColor: Colors.red,
                icon: Icon(Icons.person))
          ],
        ),
      ),
    );
  }
}
