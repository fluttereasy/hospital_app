import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/Doctor%20List%20After%20Speciality/doctor_list_bloc.dart';
import 'package:hospital_app/Screens/Appointment/ScheduleAppointment.dart';
import '../../../Screens/Appointment/select_doctor_profile_bloc.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  int? unitID;
  String? dr_ID;
  var doctoInfo;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SelectDoctorProfileBloc())],
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
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: DoctorListBloc.dataForList != null
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
                                                          .dataForList[index]
                                                      ['Name'],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  DoctorListBloc
                                                          .dataForList[index]
                                                      ['Speciality'],
                                                  style: const TextStyle(
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
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          "Fee "
                                                          "${DoctorListBloc.dataForList[index]['ConsultantCharges']}",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .red),
                                                        )
                                                      ],
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          70, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: SizedBox(
                                                      height: 40,
                                                      width: 150,
                                                      child: BlocBuilder<
                                                          SelectDoctorProfileBloc,
                                                          SelectDoctorProfileState>(
                                                        builder:
                                                            (context, state) {
                                                          return ElevatedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                dr_ID = DoctorListBloc
                                                                        .dataForList[
                                                                    index]['dr_id'];
                                                              });
                                                              // doctor_id_for_event
                                                              // print(SearchDoctors.doctorID);
                                                              // context
                                                              //     .read<
                                                              //         SelectDoctorProfileBloc>()
                                                              //     .add(DoctorSelectEvent(
                                                              //         unitID: SearchDoctors
                                                              //             .doctorID,
                                                              //         doctorId:
                                                              //         dr_ID));

                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ScheduleAppointment(
                                                                            doctorID:
                                                                                dr_ID,
                                                                          )));
                                                            },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .deepOrange),
                                                            child: const Text(
                                                                'Book Appointment'),
                                                          );
                                                        },
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
                      : const Center(
                          child: Text(
                            'Sorry No Doctor Found',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        )),
            )
          ])),
    );
  }
}
