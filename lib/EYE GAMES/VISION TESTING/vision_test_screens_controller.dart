import 'package:flutter/material.dart';
import 'package:hospital_app/EYE%20GAMES/VISION%20TESTING/vision_test_example.dart';
import 'package:hospital_app/EYE%20GAMES/VISION%20TESTING/vision_test_example_2.dart';
import 'package:hospital_app/EYE%20GAMES/VISION%20TESTING/vision_test_example_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VisionTestController extends StatefulWidget {
  const VisionTestController({Key? key}) : super(key: key);

  @override
  State<VisionTestController> createState() => _VisionTestControllerState();
}

class _VisionTestControllerState extends State<VisionTestController> {
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
                VisionTestExample(),
                VisionTestExample2(),
                VisionTestExample3(),
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
