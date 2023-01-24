import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String content =
      'A doctor is someone who is experienced and certifexperienced andal and mental health. A doctor is tasked with interacting with patients.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                          child: FaIcon(
                        FontAwesomeIcons.calendarPlus,
                        color: Colors.green,
                      )),
                    ),
                    title: const Text(
                      'Appointment Success !',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        'Today | 3:56 PM',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: Container(
                      height: 25,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                          child: Text(
                        'New',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    content,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  )),
              const SizedBox(height: 15),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.calendarMinus,
                            color: Colors.red,
                          )),
                        ),
                        title: const Text(
                          'Appointment Cancel !',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text(
                            'Today | 3:56 PM',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                              child: Text(
                            'New',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Text(
                        content,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ))
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.suitcaseMedical,
                            color: Colors.deepOrange,
                          )),
                        ),
                        title: const Text(
                          'New Service Available !',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text(
                            '14 Dec 2023 | 3:56 PM',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Text(
                        content,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ))
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.creditCard,
                            color: Colors.blueAccent,
                          )),
                        ),
                        title: const Text(
                          'Credit Card Connected !',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text(
                            'Today | 3:56 PM',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Text(
                        content,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ))
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.calendarPlus,
                            color: Colors.green,
                          )),
                        ),
                        title: const Text(
                          'Appointment Success !',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text(
                            'Today | 3:56 PM',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                              child: Text(
                            'New',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Text(
                        content,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
