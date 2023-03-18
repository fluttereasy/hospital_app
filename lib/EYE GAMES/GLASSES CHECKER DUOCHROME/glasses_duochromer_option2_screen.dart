import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/DRY%20EYE/dry_eye_disclaimer.dart';

import 'glasses_duochrome_question2.dart';

class GlassesDuochromerOption2 extends StatefulWidget {
  const GlassesDuochromerOption2({Key? key}) : super(key: key);

  @override
  State<GlassesDuochromerOption2> createState() =>
      _GlassesDuochromerOption2State();
}

class _GlassesDuochromerOption2State extends State<GlassesDuochromerOption2> {
  List<String> optionList = [
    'Clear on Red',
    'Blurry on Red',
    'Clear on Green',
    'Blurry on Green',
    'No Difference'
  ];
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
              const Center(
                  child: Text(
                    'What did you see?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20),
              Container(
                height: 300,
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
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        GlassesDuochromerQuestion2()));
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
