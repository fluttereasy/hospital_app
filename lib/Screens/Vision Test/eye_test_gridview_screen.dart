import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Screens/Vision%20Test/visual_testing.dart';

class EyeTestScreen extends StatefulWidget {
  const EyeTestScreen({Key? key}) : super(key: key);

  @override
  State<EyeTestScreen> createState() => _EyeTestScreenState();
}

class _EyeTestScreenState extends State<EyeTestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Vision Test'),
            backgroundColor: const Color(0xff225081),
          ),
          body: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 0.0),
              primary: false,
              padding: const EdgeInsets.all(20),
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'VISION TESTING',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const VisualTesting()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: const Text(
                                  'Start',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Image.asset(
                                    'images/eye.png',
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'COLOR VISION TEST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Image.asset(
                                    'images/record.png',
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'VISION TESTING',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Image.asset(
                                    'images/contrast.png',
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'CENTRAL VISION',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                    child:
                                        Image.asset('images/astigmatism.png')),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'VISION TESTING',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Image.asset(
                                    'images/shared-vision.png',
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'CONTRAST SENSITIVITY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'VISION TESTING',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'COLOR ARRANGEMENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'COLOR ARRANGEMENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff225081),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.8,
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'COLOR ARRANGEMENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffff8a00),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
    );
  }
}
