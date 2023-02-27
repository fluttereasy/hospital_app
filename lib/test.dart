import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

