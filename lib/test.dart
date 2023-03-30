import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/PHARMACY/pharmacy_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyBloc()
        ..add(PharmacyDataFetchEvent(
            phoneNumer: OtpScreen.numberForProfileScreen)),
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
        body: BlocBuilder<PharmacyBloc, PharmacyState>(
          builder: (context, state) {
            if (state is PharmacyDataLoadingState) {
              return Center(child: const CircularProgressIndicator());
            }
            if (state is PharmacyDataLoadedState) {
              final pharmacyData = state.pharmacyData;
              return pharmacyData != null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                      child: ListView.builder(
                          itemCount: pharmacyData.length,
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
                                            style:
                                            ElevatedButton.styleFrom(
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
                ],
              )
                  : const Text(
                  'There are no orders currently PLease Book to view details here');
            }
            if (state is PharmacyDataFailedState) {
              return const Center(
                child: Text(
                    'There are no orders currently PLease Book to view details here'),
              );
            }
            return Column(
              children: const [
                Center(
                  child: Text(
                    'There are no orders currently PLease Book to view details here',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

// 0xff199a8e invoice
//0xff7bec78 status
//0xffaaaaaa grey text
