import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/COLOR%20VISION%20TEST/color_vision_man_screen.dart';

import 'color_vision_pageview_screen.dart';

class ColorVisionTestDisclaimer extends StatefulWidget {
  const ColorVisionTestDisclaimer({Key? key}) : super(key: key);

  @override
  State<ColorVisionTestDisclaimer> createState() =>
      _ColorVisionTestDisclaimerState();
}

class _ColorVisionTestDisclaimerState extends State<ColorVisionTestDisclaimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Center(child: Icon(Icons.recommend)),
                Text(
                  'Recommended to pass for progress checking',
                  style: TextStyle(color: Colors.blueGrey),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.grey,
                                backgroundColor: Colors
                                    .grey, // Text Color (Foreground color)
                              ),
                              onPressed: () {},
                              child: const Text(
                                'how-to',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.amber,
                                backgroundColor: Colors
                                    .green, // Text Color (Foreground color)
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const ColorVisionPageviewScreen()));
                              },
                              child: const Text(
                                'START',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('COLOR BLINDNESS'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.blueAccent),
              child: const Center(
                  child: Text(
                '3',
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 50,
            ),
            const Text(
              "Reveals red,green or blue color weakness or blindness in person's eyes",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Text(
                  'Disclaimer:\n ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    " This test is for screening purpose only doesn't \n replace visit/consult to an eye doctor")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
