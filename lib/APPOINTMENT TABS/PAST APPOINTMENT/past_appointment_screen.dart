import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Doctor/find_doctors.dart';
import '../../OTP Directories/otp_screen.dart';
import 'past_appointment_bloc.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocProvider(
          create: (context) => PastAppointmentBloc()
            ..add(PastAppointmentFetch(
                phoneNumber: OtpScreen.numberForProfileScreen)),
          child: BlocBuilder<PastAppointmentBloc, PastAppointmentState>(
            builder: (context, state) {
              if (state is PastComingAppointmentLoading) {
                const Center(child: CircularProgressIndicator());
              }
              if (state is PastComingAppointmentLoaded) {
                final pastAppointment = state.pastList;
                print(pastAppointment);
                return pastAppointment != null
                    ? Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: pastAppointment.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 10,
                                  child: SizedBox(
                                      height: 220,
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(15),
                                            height: 70,
                                            color: Colors.white,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  child: Image.asset(
                                                      'images/ml_doctor.png'),
                                                ),
                                                const SizedBox(width: 30),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      pastAppointment[index]
                                                          ['Dr_Name'],
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    const Text(
                                                      'CATARACT',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: double.infinity,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey[300],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  pastAppointment[index]
                                                      ['App_date'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                const Icon(
                                                  Icons.timer,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  pastAppointment[index]
                                                      ['App_Time'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 130,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14))),
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ))),
                                              Container(
                                                  width: 130,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blue,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14))),
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Reschedule',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ))),
                                            ],
                                          )
                                        ],
                                      )),
                                );
                              }),
                        ),
                      )
                    : Column(
                        children: [
                          const Center(
                            child: Text('No Appointment Available'),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                              height: 50,
                              width: 150,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const SearchDoctors()));
                                  },
                                  child: const Text(
                                    'Book Now',
                                    style: TextStyle(fontSize: 20),
                                  )))
                        ],
                      );
              }
              if (state is PastComingAppointmentFailed) {
                const Center(child: Text('No Past Appointment'));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    );
  }
}
