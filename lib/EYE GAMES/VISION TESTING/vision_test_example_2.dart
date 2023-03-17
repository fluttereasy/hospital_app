import 'package:flutter/material.dart';

class VisionTestExample2 extends StatefulWidget {
  const VisionTestExample2({Key? key}) : super(key: key);

  @override
  State<VisionTestExample2> createState() => _VisionTestExample2State();
}

class _VisionTestExample2State extends State<VisionTestExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:  Container(
      //   margin: const EdgeInsets.all(10),
      //   width: 290,
      //   child: ElevatedButton(
      //       onPressed: () {},
      //       style:
      //       ElevatedButton.styleFrom(backgroundColor: Colors.green),
      //       child: const Text('NEXT')),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('VISUAL ACUITY'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'images/woman.png',
              scale: 0.2,
            )),
            const SizedBox(height: 50),
            const Text(
              "Keep head straight and the device infront of of your eyes Avoid",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
