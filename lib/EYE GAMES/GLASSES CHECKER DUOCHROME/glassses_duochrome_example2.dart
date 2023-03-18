import 'package:flutter/material.dart';

class GlassesDuochromeScreen2 extends StatefulWidget {
  const GlassesDuochromeScreen2({Key? key}) : super(key: key);

  @override
  State<GlassesDuochromeScreen2> createState() => _GlassesDuochromeScreen2State();
}

class _GlassesDuochromeScreen2State extends State<GlassesDuochromeScreen2> {
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
        title: const Text('GLASSES CHECKER/DUOCHROME'),
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
