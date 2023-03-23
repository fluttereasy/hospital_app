import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTimeOpen();
  }

  Future<void> _checkFirstTimeOpen() async {
    final prefs = await SharedPreferences.getInstance();
    final firstTimeOpen = prefs.getBool('first_time_open') ?? true;
    if (firstTimeOpen) {
      await prefs.setBool('first_time_open', false);
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.lightBlue[100],
              clipBehavior: Clip.antiAliasWithSaveLayer,
              content: SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming Appointment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Image.asset('images/ml_doctor.png'),
                      ),
                      title: const Text(
                        'Doctor Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        '04-Mar-2024',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Text(
                        '3:00 PM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text('Direction')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Contact')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Cancel')),
                  ],
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
