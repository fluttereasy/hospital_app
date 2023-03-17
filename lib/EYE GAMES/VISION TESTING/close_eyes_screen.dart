import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../COLOR VISION TEST/game_first_screen.dart';

class EyesClosedScreen extends StatelessWidget {
  const EyesClosedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        width: 290,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => TestFirstScreen()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('READY')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  'images/yright_hand.PNG',
                ),
              ),
              Image.asset('images/ysamlleye.PNG'),
              const SizedBox(height: 50),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Close your right eye',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
