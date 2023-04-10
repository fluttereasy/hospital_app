import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/surgery_bloc.dart';

import '../DOCTOR DASHBOARD/doctor_dashBoard.dart';

class MySurgeryTomorrow extends StatefulWidget {
  const MySurgeryTomorrow({Key? key}) : super(key: key);

  @override
  State<MySurgeryTomorrow> createState() => _MySurgeryTomorrowState();
}

class _MySurgeryTomorrowState extends State<MySurgeryTomorrow> {
  // Future<void> setDateTime(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked.toString().substring(0, 9);
  //       todaydate = DateTime.now();
  //     });
  //     print(selectedDate);
  //   }
  // }

  DateTime now = DateTime.now();
  late DateTime tomorrow = now.add(const Duration(days: 1));
  late String tomorrowDate =
      '${tomorrow.year}-${tomorrow.month}-${tomorrow.day}';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurgeryBloc()
        ..add(SurgeryFetchEvent(
            doctorID: DoctorDashBoard.doctorId, dateOfSurgery: tomorrowDate
            //     selectedDate == null ? '2023-01-02' : selectedDate.toString()
            )),
      child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   elevation: 0,
          //   centerTitle: true,
          //   backgroundColor: Colors.white,
          //   actions: [
          //     PopupMenuButton(
          //         itemBuilder: (context) => [
          //               PopupMenuItem(
          //                   child: InkWell(
          //                       onTap: () async {
          //                         setDateTime(context);
          //                       },
          //                       child: const Text('Choose Date')))
          //             ])
          //   ],
          //   iconTheme: const IconThemeData(color: Colors.black),
          //   title: const Text(
          //     'Surgery',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocListener<SurgeryBloc, SurgeryState>(
              listener: (context, state) {},
              child: BlocBuilder<SurgeryBloc, SurgeryState>(
                builder: (context, state) {
                  if (state is SurgeryLoadingState) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.teal,
                    ));
                  }
                  if (state is SurgeryLoadedState) {
                    print('loaded');
                    final surgeryData = state.surgeryData;
                    return Column(
                      children: [
                        surgeryData != null
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: surgeryData.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(10),
                                        height: 140,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueGrey.shade50,
                                                width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  surgeryData[index]
                                                      ['PATIENT_NAME'],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  surgeryData[index]
                                                          ['Surg_Name']
                                                      .toString()
                                                      .substring(0, 8),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  surgeryData[index]['MRD_NO'],
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                    surgeryData[index]['Side']),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 75,
                                                  decoration: BoxDecoration(
                                                      color: Colors.teal,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors
                                                              .teal.shade200)),
                                                  child: Center(
                                                    child: Text(
                                                      surgeryData[index]
                                                          ['SURG_DATE'],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  height: 24,
                                                  width: 75,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors
                                                              .teal.shade200)),
                                                  child: Center(
                                                    child: Text(
                                                      surgeryData[index]
                                                          ['SurgTime'],
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'Total',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  surgeryData[index]
                                                      ['Net_Amount'],
                                                  style: const TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }))
                            : const Center(
                                child: Text(
                                  'No Surgeries Available on this Date',
                                  textAlign: TextAlign.center,
                                ),
                              )
                      ],
                    );
                  }
                  if (state is SurgeryFailedLoadedState) {
                    return const Center(
                        child: Text('No Surgery is Available on this Date'));
                  }
                  return Text('Failed to Load Surgeries');
                },
              ),
            ),
          )),
    );
  }
}
