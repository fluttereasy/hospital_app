import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../VISION TESTING/vision_test_example_2.dart';
import '../VISION TESTING/vision_test_example_3.dart';
import 'color_vision_man_screen.dart';

class ColorVisionPageviewScreen extends StatefulWidget {
  const ColorVisionPageviewScreen({Key? key}) : super(key: key);

  @override
  State<ColorVisionPageviewScreen> createState() => _ColorVisionPageviewScreenState();
}

class _ColorVisionPageviewScreenState extends State<ColorVisionPageviewScreen> {
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
                ColorVisionManScreen(),
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
