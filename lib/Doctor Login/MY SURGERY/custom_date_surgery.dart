import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/surgery_bloc.dart';

import '../DOCTOR DASHBOARD/doctor_dashBoard.dart';

class CustomDateSurgery extends StatefulWidget {
  final doctorId;
  const CustomDateSurgery({Key? key, this.doctorId}) : super(key: key);

  @override
  State<CustomDateSurgery> createState() => _CustomDateSurgeryState();
}

class _CustomDateSurgeryState extends State<CustomDateSurgery> {
  String? selectedDate;

  Future<void> setDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(selectedDate);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: selectedDate == null
                ? Column(
                    children: [
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal),
                            onPressed: () {
                              setDateTime(context);
                            },
                            child: const Text('Choose Date')),
                      )
                    ],
                  )
                : BlocProvider(
                    create: (context) => SurgeryBloc()
                      ..add(SurgeryFetchEvent(
                          doctorID: DoctorDashBoard.doctorId, dateOfSurgery: selectedDate)),
                    child: BlocBuilder<SurgeryBloc, SurgeryState>(
                      builder: (context, state) {
                        if (state is SurgeryLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.teal));
                        }
                        if (state is SurgeryLoadedState) {
                          final surgeryData = state.surgeryData;
                          print(surgeryData);
                          return Column(
                            children: [
                              Expanded(
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
                                                  color:
                                                      Colors.blueGrey.shade50,
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
                                                    surgeryData[index]
                                                        ['MRD_NO'],
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(surgeryData[index]
                                                      ['Side']),
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
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors.teal
                                                                .shade200)),
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
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors.teal
                                                                .shade200)),
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
                                      })),
                            ],
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                                child:
                                    Text('No Surgery is Available on this Date')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal),
                                onPressed: () {
                                  setDateTime(context);
                                },
                                child: const Text('Choose Date')),
                          ],
                        );
                      },
                    ),
                  )));
  }
}

// Expanded(
//                                 child: ListView.builder(
//                                     itemCount: surgeryData.length,
//                                     itemBuilder: (context, index) {
//                                       return Container(
//                                         margin: const EdgeInsets.all(10),
//                                         padding: const EdgeInsets.all(10),
//                                         height: 140,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.blueGrey.shade50,
//                                                 width: 3),
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   surgeryData[index]
//                                                       ['PATIENT_NAME'],
//                                                   style: const TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                                 Text(
//                                                   surgeryData[index]
//                                                           ['Surg_Name']
//                                                       .toString()
//                                                       .substring(0, 8),
//                                                   style: const TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Text(
//                                                   surgeryData[index]['MRD_NO'],
//                                                   style: const TextStyle(
//                                                       color: Colors.grey),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 Text(
//                                                     surgeryData[index]['Side']),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   height: 24,
//                                                   width: 75,
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.teal,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10),
//                                                       border: Border.all(
//                                                           color: Colors
//                                                               .teal.shade200)),
//                                                   child: Center(
//                                                     child: Text(
//                                                       surgeryData[index]
//                                                           ['SURG_DATE'],
//                                                       style: const TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 10,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           letterSpacing: 1),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 10),
//                                                 Container(
//                                                   height: 24,
//                                                   width: 75,
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10),
//                                                       border: Border.all(
//                                                           color: Colors
//                                                               .teal.shade200)),
//                                                   child: Center(
//                                                     child: Text(
//                                                       surgeryData[index]
//                                                           ['SurgTime'],
//                                                       style: const TextStyle(
//                                                           color: Colors.grey,
//                                                           fontSize: 10,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           letterSpacing: 1),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             const SizedBox(height: 12),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 const Text(
//                                                   'Total',
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                                 Text(
//                                                   surgeryData[index]
//                                                       ['Net_Amount'],
//                                                   style: const TextStyle(
//                                                       color: Colors.teal,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       );
//                                     }))
