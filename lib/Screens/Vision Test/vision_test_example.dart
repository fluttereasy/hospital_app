import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VisionTestExample extends StatefulWidget {
  const VisionTestExample({Key? key}) : super(key: key);

  @override
  State<VisionTestExample> createState() => _VisionTestExampleState();
}

class _VisionTestExampleState extends State<VisionTestExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.all(10),
      //   width: 290,
      //   child: ElevatedButton(
      //       onPressed: () {},
      //       style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      //       child: const Text('NEXT')),
      // ),
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
              'images/man.png',
              scale: 0.2,
            )),
            const SizedBox(height: 50),
            const Text(
              "Hold at outstretch arm's length\n (approx. 40cm)",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
