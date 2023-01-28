import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hospital_app/Screens/Notification/notification_data.dart';

// swipe delete enum class
enum Action { delete, archive }

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
        body: ListView.builder(
            itemCount: NotificationData.titleList.length,
            itemBuilder: (context, index) {
              final item = NotificationData.titleList;
              return Slidable(
                  startActionPane:
                      ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.red,
                        icon: Icons.delete_outline,
                        label: 'Delete',
                        onPressed: (context) {
                          setState(() {
                            NotificationData.titleList.removeAt(index);
                          });
                        })
                  ]),
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
                                color: Colors.pink.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: NotificationData.iconList[index],
                            ),
                            title: Text(
                              NotificationData.titleList[index],
                              style: const TextStyle(
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
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            content,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          )),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ));
            }));
  }

  // void onDismiss(int index, Action action) {}
}
