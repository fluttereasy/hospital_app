import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/OPTICAL/optical_bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';

class OpticalScreen extends StatefulWidget {
  const OpticalScreen({Key? key}) : super(key: key);

  @override
  State<OpticalScreen> createState() => _OpticalScreenState();
}

class _OpticalScreenState extends State<OpticalScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OpticalBloc()
        ..add(OpticalBillFetchEvent(
            phoneNumber: OtpScreen.numberForProfileScreen)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Orders',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color(0xff1998ae),
                    borderRadius: BorderRadius.circular(8)),
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
              BlocBuilder<OpticalBloc, OpticalState>(
                builder: (context, state) {
                  if (state is OpticalBillLoadingState) {
                    const CircularProgressIndicator();
                  }
                  if (state is OpticalBillLoadedState) {
                    final opticalData = state.opticalData;
                    return opticalData != null
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: opticalData.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffE8f3f1)),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 160,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Order NO.',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(opticalData[index]
                                                        ['RecieptNo']),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text('Rs'),
                                                    const SizedBox(width: 2),
                                                    Text(opticalData[index]
                                                        ['TotalAmount'])
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
                                                  children: [
                                                    const Icon(
                                                      Icons.calendar_month,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(opticalData[index]
                                                        ['RecieptDate']),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(width: 8),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.timer,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(opticalData[index]
                                                        ['recieptTime']),
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
                                                  children: [
                                                    const Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Color(0xff7bec78),
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(opticalData[index]
                                                        ['DeliveryStatus']),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Balance :',
                                              style: TextStyle(
                                                  color: Color(0xffaaaaaa)),
                                            ),
                                            const SizedBox(width: 3),
                                            Text(opticalData[index]['Balance'],
                                                style: const TextStyle(
                                                    color: Color(0xffaaaaaa)))
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              const Color(
                                                                  0xffE8f3f1)),
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Download Invoice',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: 160,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              const Color(
                                                                  0xff199a8e)),
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'PAY NOW',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }))
                        : const Center(
                            child: Text(
                                'There are no orders available for you right now\n Book orders to view your details here'));
                    ;
                  }
                  return Column(
                    children: const [
                      Center(
                        child: Text(
                          'There are no orders avaialable for you right now\n Book orders to view your details here',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//There are no orders avaialable for you right now\n Book orders to view your details here
