import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/ACCOMODATION/accomodation_disclaimer_screen.dart';
import 'package:hospital_app/EYE%20GAMES/DRY%20EYE/dry_eye_disclaimer.dart';

class AccomodationQuestionScreen extends StatefulWidget {
  const AccomodationQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AccomodationQuestionScreen> createState() =>
      _AccomodationQuestionScreenState();
}

class _AccomodationQuestionScreenState
    extends State<AccomodationQuestionScreen> {
  List<String> optionList = ['NEVER', 'RARELY', 'SOMETIMES', 'OFTEN'];
  List<String> questionList = [
    'Does your vision fluctuate during the day?',
    'Do you have pain in the eyebrow area',
    'How often your eyes get red',
    'Is it difficult for you to concentrate while reading/computer work?',
    'How often do you have pain in the eyes',
    ' Do your eyes get tired quickly',
    'Do you have blurry doubled vision',
    'How often your eyes get tears without a particular reason?',
    'Does your vision worsen after long work with your computer',
  ];
  int indexforQuestion = 0;
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                questionList[indexforQuestion],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: 300,
                color: Colors.white,
                child: ListView.builder(
                    itemCount: optionList.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: const BorderSide(color: Colors.grey),
                              backgroundColor: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (indexforQuestion == 8) {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const AccomodationDisclaimerScreen()));
                              } else if (indexforQuestion >= 0) {
                                indexforQuestion++;
                              }
                            });
                          },
                          child: Text(
                            optionList[index],
                            style: const TextStyle(color: Colors.black87),
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
