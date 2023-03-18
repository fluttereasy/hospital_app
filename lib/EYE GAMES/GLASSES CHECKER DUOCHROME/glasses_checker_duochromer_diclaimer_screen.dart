import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/GLASSES%20CHECKER%20DUOCHROME/glassses+_duochromer_first_screen.dart';

class GlassesCheckerDisclaimerScreen extends StatefulWidget {
  const GlassesCheckerDisclaimerScreen({Key? key}) : super(key: key);

  @override
  State<GlassesCheckerDisclaimerScreen> createState() =>
      _GlassesCheckerDisclaimerScreenState();
}

class _GlassesCheckerDisclaimerScreenState
    extends State<GlassesCheckerDisclaimerScreen> {
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
                                        const GlassesCheckerFirstScreen()));
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
        title: const Text('GLASSES CHECKER/DUOCHROME'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/icon_glass_checker.PNG',
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 50,
            ),
            const Text(
              "Check whether your glasses are appropriate for good vision",
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

//GlassesCheckerDisclaimerScreen
