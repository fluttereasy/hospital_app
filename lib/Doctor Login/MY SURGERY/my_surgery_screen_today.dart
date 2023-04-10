import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/surgery_bloc.dart';

import '../DOCTOR DASHBOARD/doctor_dashBoard.dart';

class MySurgeryToday extends StatefulWidget {
  const MySurgeryToday({Key? key}) : super(key: key);

  @override
  State<MySurgeryToday> createState() => _MySurgeryTodayState();
}

class _MySurgeryTodayState extends State<MySurgeryToday> {
  String todaysDate = DateTime.now().toString().substring(0, 10);
  String? doctorLoginID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurgeryBloc()
        ..add(SurgeryFetchEvent(
            doctorID: DoctorDashBoard.doctorId, dateOfSurgery: todaysDate)),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
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
                                      width: MediaQuery.of(context).size.width,
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
                                                MainAxisAlignment.spaceBetween,
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
                                                surgeryData[index]['MRD_NO'],
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            children: [
                                              Text(
                                                surgeryData[index]['Surg_Name']
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(surgeryData[index]['Side']),
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
                                                MainAxisAlignment.spaceBetween,
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
                  return Center(
                      child: Text('No Surgery is Available on this Date'));
                }
                return Text('Failed to Load Surgeries');
              },
            ),
          )),
    );
  }
}
