import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../GLASSES CHECKER DUOCHROME/glasses_duochrome_question_screen.dart';

class AstigmatismThirdScreen extends StatefulWidget {
  const AstigmatismThirdScreen({Key? key}) : super(key: key);

  @override
  State<AstigmatismThirdScreen> createState() => _AstigmatismThirdScreenState();
}

class _AstigmatismThirdScreenState extends State<AstigmatismThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10),
          width: 290,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const GlassesDuochromeQuestion()));
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'images/astigmatism_slide_img.PNG',
                height: 200,
              )),
              const SizedBox(height: 50),
              const Text(
                "TRy to identify if some of the lines are blurry in different directions",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//astigmatism_slide_img.PNG
