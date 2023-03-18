import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glasses_duochrome_question_screen.dart';

class GlassesDuochromeScreen3 extends StatefulWidget {
  const GlassesDuochromeScreen3({Key? key}) : super(key: key);

  @override
  State<GlassesDuochromeScreen3> createState() =>
      _GlassesDuochromeScreen3State();
}

class _GlassesDuochromeScreen3State extends State<GlassesDuochromeScreen3> {
  List imageList = [
    'images/visiona.png, images/visionc.png, images/visione.png , images/visionone.png, images/visionumbrella.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        width: 290,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>GlassesDuochromeQuestion()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'START',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('GLASSES CHECKER/DUOCHROME'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'images/ducochrome_img.png',
              height: 100,
            )),
            const SizedBox(height: 50),
            const Text(
              "Try to identify the object does it look blurry or clear or not visible?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
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
