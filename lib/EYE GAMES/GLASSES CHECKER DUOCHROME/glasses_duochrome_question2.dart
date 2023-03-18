import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glasses_duochromer_option2_screen.dart';


class GlassesDuochromerQuestion2 extends StatefulWidget {
  const GlassesDuochromerQuestion2({Key? key}) : super(key: key);

  @override
  State<GlassesDuochromerQuestion2> createState() =>
      _GlassesDuochromerQuestion2State();
}

class _GlassesDuochromerQuestion2State extends State<GlassesDuochromerQuestion2> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => GlassesDuochromerOption2()));
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
          body: Container(
            height: double.infinity,
            child: Image.asset(
              'images/glass_c.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
