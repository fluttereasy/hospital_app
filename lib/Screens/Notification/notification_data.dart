import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NotificationData {


  static List titleList = [
    'Appointment Cancel !',
    'Appointment Success !',
    'New Service Available',
    'Credit Card Connected',
    'Appointment Success !',
  ];

  List<String> titleLists = [
      'Appointment Cancel !',
      'Appointment Success !',
      'New Service Available',
      'Credit Card Connected',
      'Appointment Success !',
  ];

  static List iconList = <Widget>[
    const Center(
        child: FaIcon(
      FontAwesomeIcons.calendarMinus,
      color: Colors.red,
    )),
    const Center(
        child: FaIcon(
      FontAwesomeIcons.calendarPlus,
      color: Colors.green,
    )),
    const Center(
        child: FaIcon(
      FontAwesomeIcons.suitcaseMedical,
      color: Colors.deepOrange,
    )),
    const Center(
        child: FaIcon(
      FontAwesomeIcons.creditCard,
      color: Colors.blue,
    )),
    const Center(
        child: FaIcon(
      FontAwesomeIcons.calendarPlus,
      color: Colors.blue,
    )),
  ];
}
