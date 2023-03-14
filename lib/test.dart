import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0),
              primary: false,
              padding: const EdgeInsets.all(20),
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     CupertinoPageRoute(
                    //         builder: (context) => const ApointmentBar()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                                      '1',
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
                                'Alphabet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
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
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: const Text(
                                  'Start',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
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
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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
                        color: Colors.blue,
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
                                    'Sawan',
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
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
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