import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'close_eyes_screen.dart';

class VisionTestExample3 extends StatefulWidget {
  const VisionTestExample3({Key? key}) : super(key: key);

  @override
  State<VisionTestExample3> createState() => _VisionTestExample3State();
}

class _VisionTestExample3State extends State<VisionTestExample3> {
  List imageList = [
    'images/visiona.png, images/visionc.png, images/visione.png , images/visionone.png, images/visionumbrella.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        width: 290,
        child: ElevatedButton(
            onPressed: () {
              _bottomSheet(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'START',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('VISUAL ACUITY'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'images/frag_visual_acuity.png',
              height: 200,
            )),
            const SizedBox(height: 50),
            const Text(
              "Try to identify the object does it look blurry or clear or not visible",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Container(
            height: 180,
            color: Color(0xfff84956),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'SELECT TYPE OF TEST',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 15),
                Container(
                    height: 60,
                    width: double.infinity,
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          EyesClosedScreen()));
                            },
                            child: Image.asset(
                              'images/visiona.png',
                              height: double.infinity,
                              fit: BoxFit.fill,
                              width: 80,
                            ),
                          ),
                          Image.asset(
                            'images/visionc.png',
                            height: double.infinity,
                            fit: BoxFit.fill,
                            width: 80,
                          ),
                          Image.asset(
                            'images/visione.png',
                            height: double.infinity,
                            fit: BoxFit.fill,
                            width: 80,
                          ),
                          Image.asset(
                            'images/visionone.png',
                            height: double.infinity,
                            fit: BoxFit.fill,
                            width: 80,
                          ),
                          Image.asset(
                            'images/visionumbrella.png',
                            height: double.infinity,
                            fit: BoxFit.fill,
                            width: 80,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}

// ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                     Image.asset(
//                       'images/visiona.png',
//                       height: double.infinity,
//                     ),
//                     Image.asset(
//                       'images/visionc.png',
//                       height: double.infinity,
//                     ),
//                     Image.asset(
//                       'images/visione.png',
//                       height: double.infinity,
//                     ),
//                     Image.asset(
//                       'images/visionone.png',
//                       height: double.infinity,
//                     ),
//                     Image.asset(
//                       'images/visionumbrella.png',
//                       height: double.infinity,
//                     ),
//                       ],
//                     )
