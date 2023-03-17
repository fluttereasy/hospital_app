import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'option_screen.dart';

class TestFirstScreen extends StatefulWidget {
  static String rightImage='';
  const TestFirstScreen({Key? key}) : super(key: key);

  @override
  State<TestFirstScreen> createState() => _TestFirstScreenState();
}

class _TestFirstScreenState extends State<TestFirstScreen> {
  String? rightImage;
  getRandomImage() {
    List<String> imageList = [
      // 'images/lea_airplan.png',
      // 'images/lea_car.png',
      // 'images/lea_elephant.png',
      'images/lea_mushroom.png',
      'images/lea_star.png',
      'images/lea_tree.png',
      'images/lea_teapot.png'
    ];
    final Random random = Random();
    // rightImage = imageList[random.nextInt(imageList.length)];
    return TestFirstScreen.rightImage = imageList[random.nextInt(imageList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              getRandomImage(),
              height: 50,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => OptionScreen()));
              },
              child: Text('next'))
        ],
      ),
    );
  }
}
