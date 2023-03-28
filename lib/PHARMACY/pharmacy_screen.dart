import 'package:flutter/material.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Pharmacy',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE8f3f1)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Order NO.',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 5),
                                        Text('123654789000'),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text('Rs'),
                                        SizedBox(width: 2),
                                        Text('1000')
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        SizedBox(width: 4),
                                        Text('26/06/2022'),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.timer,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        SizedBox(width: 4),
                                        Text('10:30 AM'),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Color(0xff7bec78),
                                        ),
                                        SizedBox(width: 4),
                                        Text('Status'),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff199a8e)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Download Invoice',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

// 0xff199a8e invoice
//0xff7bec78 status
//0xffaaaaaa grey text
