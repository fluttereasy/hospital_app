import 'package:flutter/material.dart';

class AstigmatismWomanController extends StatefulWidget {
  const AstigmatismWomanController({Key? key}) : super(key: key);
  @override
  State<AstigmatismWomanController> createState() =>
      _AstigmatismWomanControllerState();
}

class _AstigmatismWomanControllerState
    extends State<AstigmatismWomanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 10),
            const Text(
              "Keep head straight and the device infront of of your eyes",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
