import 'package:flutter/material.dart';

// swipe delete enum class
enum Action { delete, archive }

class PaymentConnected extends StatefulWidget {
  const PaymentConnected({Key? key}) : super(key: key);

  @override
  State<PaymentConnected> createState() => _PaymentConnectedState();
}

class _PaymentConnectedState extends State<PaymentConnected> {
  String content =
      'A doctor is someone who is experienced and certified experienced and mental health. A doctor is tasked with interacting with patients.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.document_scanner_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Payment',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'images/paytm.jpg',
                            height: 40,
                          ),
                          title: const Text(
                            'Paytm',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Text(
                            'Connected',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'images/ml_google.png',
                            height: 40,
                          ),
                          title: const Text(
                            'Google Pay',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Text(
                            'Connected',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'images/apple.jpg',
                            height: 40,
                          ),
                          title: const Text(
                            'Apple Pay',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Text(
                            'Connected',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }));
  }
}
