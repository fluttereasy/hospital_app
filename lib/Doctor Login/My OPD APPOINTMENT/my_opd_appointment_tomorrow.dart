import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor%20Login/DOCTOR%20DASHBOARD/doctor_dashBoard.dart';
import '../Doctor Login Appointment Tabs/doctor_login_opd_appointment_bloc.dart';

class OpdAppointmentTomorrow extends StatefulWidget {
  const OpdAppointmentTomorrow({Key? key}) : super(key: key);

  @override
  State<OpdAppointmentTomorrow> createState() => _OpdAppointmentTomorrowState();
}

class _OpdAppointmentTomorrowState extends State<OpdAppointmentTomorrow> {
  DateTime now = DateTime.now();
  late DateTime tomorrow = now.add(const Duration(days: 1));
  late String tomorrowDate =
      '${tomorrow.year}-${tomorrow.month}-${tomorrow.day}';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DoctorLoginOpdAppointmentBloc()
          ..add(DoctorOpdFetchEvent(doctorID: DoctorDashBoard.doctorId  , date: tomorrowDate)),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<DoctorLoginOpdAppointmentBloc,
                      DoctorLoginOpdAppointmentState>(
                    builder: (context, state) {
                      if (state is DoctorLoginOpdAppointmentLoadingState) {
                        return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.teal));
                      }
                      if (state is DoctorLoginOpdAppointmentLoadedState) {
                        final appointmentData = state.apppointmentData;
                        print(appointmentData!=null);
                        return appointmentData!=null?Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                                itemCount: appointmentData.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    height: 120,
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
                                              appointmentData[index]['PatientName'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              appointmentData[index]['status'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              height: 24,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  color: Colors.teal,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .teal.shade200)),
                                              child: Center(
                                                child: Text(
                                                  appointmentData[index]['App_date'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1),
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
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .teal.shade200)),
                                              child: Center(
                                                child: Text(
                                                  appointmentData[index]['App_time'],
                                                  style: TextStyle(
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
                                            Text(
                                              'Transaction',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              appointmentData[index]['Transaction_Status'],
                                              style: TextStyle(
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                })):Center(
                                  child: const Text(
                            'No Appointment Available on this Date'),
                                );
                      }
                      return const Text(
                          'No Appointment Available on this Date');
                    },
                  )
                ],
              ),
            )));
  }
}
