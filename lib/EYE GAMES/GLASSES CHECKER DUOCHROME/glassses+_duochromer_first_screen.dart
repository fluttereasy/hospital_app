import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glasses_checker_duochromer_page_controller.dart';

class GlassesCheckerFirstScreen extends StatefulWidget {
  const GlassesCheckerFirstScreen({Key? key}) : super(key: key);

  @override
  State<GlassesCheckerFirstScreen> createState() =>
      _GlassesCheckerFirstScreenState();
}

class _GlassesCheckerFirstScreenState extends State<GlassesCheckerFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => GlassesCheckerPageController()));
            },
            child: const Text('START')),
      ),
      appBar: AppBar(
        title: const Text('GLASSES CHECKER/DUOCHROME'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/glass_check_img.png')),
          const SizedBox(height: 50),
          const Text('Wear your glasses'),
        ],
      ),
    );
  }
}
