import 'package:flutter/material.dart';

import 'AppHeader.dart';
import 'PaymentMode.dart';

class MyDemoScreen1 extends StatefulWidget {
  @override
  _MyDemoScreen1State createState() => _MyDemoScreen1State();
}

class _MyDemoScreen1State extends State<MyDemoScreen1> {
  int currentPageNo = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppHeader(),
        Expanded(
          child: PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              /*Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Expanded(child: Center(child: Text('Screen 1 demo'))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              child: Text('Next Screen'),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),*/
              // LoginScreen(controller: controller,),
              // PaymentMode(controller: controller,),
              // CardDetails(),
              // NetBanking(),
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Expanded(child: Center(child: Text('Screen 2 demo'))),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          child: Text('Previous Screen'),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          child: Text('Next Screen'),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Expanded(child: Center(child: Text('Screen 3 demo'))),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          child: Text('Previous Screen'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      leading: null,
      title: Text('Plugin Appbar'),
    );
  }
}
