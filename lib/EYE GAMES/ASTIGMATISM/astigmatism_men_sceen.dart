import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AstigmatismMenScreen extends StatefulWidget {
  const AstigmatismMenScreen({Key? key}) : super(key: key);

  @override
  State<AstigmatismMenScreen> createState() => _AstigmatismMenScreenState();
}

class _AstigmatismMenScreenState extends State<AstigmatismMenScreen> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
                  'images/man.png',
                  scale: 0.2,
                )),
            const SizedBox(height: 10),
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
