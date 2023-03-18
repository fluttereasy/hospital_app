import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/DRY%20EYE/dry_eye_disclaimer.dart';

class QuestioneOne extends StatefulWidget {
  const QuestioneOne({Key? key}) : super(key: key);

  @override
  State<QuestioneOne> createState() => _QuestioneOneState();
}

class _QuestioneOneState extends State<QuestioneOne> {
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
                                            const DryEyeDisclaimer()));
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
