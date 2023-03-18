import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'glasses_duochrome_option_screen.dart';

class GlassesDuochromeQuestion extends StatefulWidget {
  const GlassesDuochromeQuestion({Key? key}) : super(key: key);

  @override
  State<GlassesDuochromeQuestion> createState() =>
      _GlassesDuochromeQuestionState();
}

class _GlassesDuochromeQuestionState extends State<GlassesDuochromeQuestion> {
  bool showQuestion = false;
  List<String> optionList = ['NEVER', 'RARELY', 'SOMETIMES', 'OFTEN'];
  List<String> questionList = [
    'Do your eyes Scratch ?',
    'Do your eyes feel strained',
    'Do you blink often',
    'Are your eyes sensitive to light',
    'Do you get blurry vision',
    ' Do you experience eye redness?',
    'Are your eyes sensitive to wind, computer\nscreen or heater',
    'Do you feel like there is some foreign object in your eye',
    'Is there a burning sensation in your eyes?',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => const GlassesDuochromerOption()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text(
                  'Do you want to Quit',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('NO')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('YES')),
                    ],
                  ),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: double.infinity,
            child: Image.asset(
              'images/glass_e.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
