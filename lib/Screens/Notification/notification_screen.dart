import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String content = 'A doctor is someone who is experienced and certifexperienced andal and mental health. A doctor is tasked with interacting with patients.';

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(30.0)),
                            child: const Icon(Icons.calendar_month)),
                        title: const Text(
                          'Appointment Cancel !',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        subtitle: const Text('Today | 3:56 PM',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        child: Text(content,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),),
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
