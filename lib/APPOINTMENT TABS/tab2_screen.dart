import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red[100],
            ),
          )
        ],
      ),
    );
  }
}
