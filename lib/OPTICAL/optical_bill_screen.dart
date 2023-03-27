import 'package:flutter/material.dart';

class OpticalScreen extends StatefulWidget {
  const OpticalScreen({Key? key}) : super(key: key);

  @override
  State<OpticalScreen> createState() => _OpticalScreenState();
}

class _OpticalScreenState extends State<OpticalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            const Text(
              'Orders',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                  color: Color(0xff1998ae), borderRadius: BorderRadius.circular(8)),
              child: const Center(
                  child: Text(
                'My Orders',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
            ),
            const SizedBox(height: 8),
            Expanded(child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE8f3f1)),
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
                    SizedBox(height: 10),
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
                        SizedBox(width: 8),
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
                        SizedBox(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Balance :',
                          style: TextStyle(color: Color(0xffaaaaaa)),
                        ),
                        SizedBox(width: 3),
                        Text('200', style: TextStyle(color: Color(0xffaaaaaa)))
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffE8f3f1)),
                              onPressed: () {},
                              child: const Text(
                                'Download Invoice',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Container(
                          height: 40,
                          width: 160,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff199a8e)),
                              onPressed: () {},
                              child: const Text(
                                'PAY NOW',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
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

// Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Order NO.',
//                                   style: TextStyle(
//                                       fontSize: 16, fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(width: 5),
//                                 const Text('123654789000'),
//                                 Column(
//                                   children: [Row(
//                                     children: const [
//                                       Text('Rs'),
//                                       Text('1000')
//                                     ],
//                                   )],
//                                 )
//                               ],
//                             )
