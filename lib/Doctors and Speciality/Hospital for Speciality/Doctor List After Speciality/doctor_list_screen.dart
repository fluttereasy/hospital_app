import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/Doctor%20List%20After%20Speciality/doctor_list_bloc.dart';
import 'package:hospital_app/Screens/Appointment/appopintment_screen.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListBloc(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Book Appointment'),
            elevation: 0,
            backgroundColor: Colors.blue,
          ),
          body: Column(children: [
            const SizedBox(height: 2),
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<DoctorListBloc, DoctorListState>(
                    builder: (context, state) {
                      if (state is DoctorListScreenState) {}
                      return DoctorListBloc.dataForList != null
                          ? ListView.builder(
                              itemCount: DoctorListBloc.dataForList.length,
                              itemBuilder: ((context, index) => Card(
                                    elevation: 3,
                                    child: SizedBox(
                                      height: 155,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const CircleAvatar(
                                                  radius: 40,
                                                  child: Image(
                                                      image: AssetImage(
                                                          'images/ml_doctor.png')),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      DoctorListBloc
                                                              .dataForList[
                                                          index]['Name'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      DoctorListBloc
                                                              .dataForList[
                                                          index]['Speciality'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                    Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            60, 10, 30, 10),
                                                        child: Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .calendar_today_outlined),
                                                            const SizedBox(
                                                                width: 5),
                                                            const Text(
                                                              '3 Years',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Text(
                                                              "Fee "
                                                              "${DoctorListBloc.dataForList[index]['ConsultantCharges']}",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .red),
                                                            )
                                                          ],
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          70, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          height: 40,
                                                          width: 150,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const ScheduleAppointment()));
                                                            },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .deepOrange),
                                                            child: const Text(
                                                                'Book Appointment'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )))
                          : Center(
                              child: Container(
                                child: const Text(
                                  'Sorry No Doctor Found',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                    },
                  )),
            )
          ])),
    );
  }
}
