import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor%20Login/Doctor%20Login%20Appointment%20Tabs/doctor_login_opd_appointment_bloc.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/surgery_bloc.dart';

import '../DOCTOR DASHBOARD/doctor_dashBoard.dart';

class CustomDateOpdAppointment extends StatefulWidget {
  final doctorId;
  const CustomDateOpdAppointment({Key? key, this.doctorId}) : super(key: key);

  @override
  State<CustomDateOpdAppointment> createState() =>
      _CustomDateOpdAppointmentState();
}

class _CustomDateOpdAppointmentState extends State<CustomDateOpdAppointment> {
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
                    create: (context) => DoctorLoginOpdAppointmentBloc()
                      ..add(DoctorOpdFetchEvent(
                          doctorID: '1439', date: selectedDate)),
                    child: BlocBuilder<DoctorLoginOpdAppointmentBloc,
                        DoctorLoginOpdAppointmentState>(
                      builder: (context, state) {
                        if (state is DoctorLoginOpdAppointmentLoadingState) {
                          print('loading');
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.teal));
                        }
                        if (state is DoctorLoginOpdAppointmentFailedState) {
                          print('loaded');
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                  child: Text(
                                      'No Available is Available on this Date')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal),
                                  onPressed: () {
                                    setDateTime(context);
                                  },
                                  child: const Text('Choose Date')),
                            ],
                          );
                        }
                        if (state is DoctorLoginOpdAppointmentLoadedState) {
                          print('loaded');
                          final appointmentData = state.apppointmentData;
                          print(appointmentData);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appointmentData != null
                                  ? Expanded(
                                      child: ListView.builder(
                                          itemCount: appointmentData.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.all(10),
                                              padding: const EdgeInsets.all(10),
                                              height: 140,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors
                                                          .blueGrey.shade50,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
                                                        appointmentData[0]
                                                            ['PatientName'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        appointmentData[0]
                                                            ['status'],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        appointmentData[0]
                                                            ['taken_By'],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 24,
                                                        width: 70,
                                                        decoration: BoxDecoration(
                                                            color: Colors.teal,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .teal
                                                                    .shade200)),
                                                        child: const Center(
                                                          child: Text(
                                                            'Wed 23',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Container(
                                                        height: 24,
                                                        width: 70,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .teal
                                                                    .shade200)),
                                                        child: const Center(
                                                          child: Text(
                                                            '03:00 PM',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1),
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
                                                    children: const [
                                                      Text(
                                                        'Total',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Rs- 5000',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }))
                                  : Center(child: Text('NO Appoinment avalable on this Date'))
                            ],
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                                child: Text(
                                    'No Available is Available on this Date')),
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
