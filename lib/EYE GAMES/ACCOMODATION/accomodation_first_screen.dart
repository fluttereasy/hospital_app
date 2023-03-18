import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'accomodation_question_screen.dart';

class AccomodationFirstScreen extends StatefulWidget {
  const AccomodationFirstScreen({Key? key}) : super(key: key);

  @override
  State<AccomodationFirstScreen> createState() =>
      _AccomodationFirstScreenState();
}

class _AccomodationFirstScreenState extends State<AccomodationFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => AccomodationQuestionScreen()));
            },
            child: const Text('START')),
      ),
      appBar: AppBar(
        title: const Text('DRY EYE'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/swipe_image.PNG')),
          const SizedBox(height: 50),
          const Text('Swipe for next question'),
        ],
      ),
    );
  }
}
