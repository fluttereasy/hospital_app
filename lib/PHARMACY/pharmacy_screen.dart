import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/PHARMACY/pharmacy_bloc.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PharmacyBloc()..add(PharmacyDataFetchEvent(phoneNumer: '7982208767')),
      child: Scaffold(
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                BlocBuilder<PharmacyBloc, PharmacyState>(
                  builder: (context, state) {
                    if (state is PharmacyDataLoadingState) {
                      print('loading');
                      return const CircularProgressIndicator();
                    }
                    if (state is PharmacyDataLoadedState) {
                      print('loaded');
                      final pharmacyData = state.pharmacyData;
                      return pharmacyData != null
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: pharmacyData.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffE8f3f1)),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(pharmacyData[index]
                                                          ['reciept_no']),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text('Rs'),
                                                      SizedBox(width: 2),
                                                      Text(pharmacyData[index]
                                                          ['amount'])
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
                                                      Text(pharmacyData[index]
                                                              ['receipt_date']
                                                          .toString()
                                                          .substring(0, 8)),
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
                                                      Text(pharmacyData[index]
                                                              ['receipt_date']
                                                          .toString()
                                                          .substring(9, 20)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              // Column(
                                              //   children: [
                                              //     Row(
                                              //       children: [
                                              //         Icon(
                                              //           Icons.circle,
                                              //           size: 10,
                                              //           color: Color(0xff7bec78),
                                              //         ),
                                              //         SizedBox(width: 4),
                                              //         Text(pharmacyData[index]['']),
                                              //       ],
                                              //     )
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xff199a8e)),
                                                    onPressed: () {},
                                                    child: const Text(
                                                      'Download Invoice',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }))
                          : Text('Not Available');
                    }
                    return Text('Not Available');
                  },
                )
              ],
            ),
          )),
    );
  }
}

// 0xff199a8e invoice
//0xff7bec78 status
//0xffaaaaaa grey text
