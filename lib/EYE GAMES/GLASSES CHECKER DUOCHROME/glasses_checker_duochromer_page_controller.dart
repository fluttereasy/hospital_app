import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/VISION%20TESTING/vision_test_example_2.dart';
import 'package:hospital_app/EYE%20GAMES/VISION%20TESTING/vision_test_example_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'GlassesDuochromeScreen3.dart';
import 'glasses_duochrome_example.dart';
import 'glassses_duochrome_example2.dart';

class GlassesCheckerPageController extends StatefulWidget {
  const GlassesCheckerPageController({Key? key}) : super(key: key);

  @override
  State<GlassesCheckerPageController> createState() => _GlassesCheckerPageControllerState();
}

class _GlassesCheckerPageControllerState extends State<GlassesCheckerPageController> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: PageView(
              controller: _controller,
              children: const [
                GlassesDuochromeScreen(),
                GlassesDuochromeScreen2(),
                GlassesDuochromeScreen3(),
              ],
            ),
          ),
          SmoothPageIndicator(
              effect: const SwapEffect(activeDotColor: Colors.green),
              controller: _controller,
              count: 3)
        ],
      ),
    );
  }
}
