import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Internet/internet_bloc.dart';
import '../Internet/internet_states.dart';

class TestClass extends StatefulWidget {
  const TestClass({Key? key}) : super(key: key);

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(listeners: [
        BlocListener<InternetBLoc, InternetStates>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 20,
                  duration: const Duration(milliseconds: 1500),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(10),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Internet Connected',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    ],
                  ),
                  backgroundColor: Colors.green,
                ));
              }
            }),
        BlocListener<InternetBLoc, InternetStates>(
            listener: (context, state) {
              if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(milliseconds: 1500),
                  elevation: 20,
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(10),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'No Internet Connection',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.dangerous,
                        color: Colors.white,
                      )
                    ],
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            }),
      ], child: const Text('')),
    );
  }
}
