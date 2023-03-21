import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../VISION TESTING/vision_test_example_2.dart';
import '../VISION TESTING/vision_test_example_3.dart';
import 'astigmatism_3rd_screen_of_page_controller.dart';
import 'astigmatism_men_sceen.dart';
import 'astigmatism_women_screen.dart';

class AstigmatismPageController extends StatefulWidget {
  const AstigmatismPageController({Key? key}) : super(key: key);

  @override
  State<AstigmatismPageController> createState() => _AstigmatismPageControllerState();
}

class _AstigmatismPageControllerState extends State<AstigmatismPageController> {
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
                AstigmatismMenScreen(),
                AstigmatismWomanController(),
                AstigmatismThirdScreen(),
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
