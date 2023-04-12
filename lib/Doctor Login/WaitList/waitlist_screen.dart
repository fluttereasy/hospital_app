// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospital_app/Doctor%20Login/DOCTOR%20DASHBOARD/doctor_dashBoard.dart';
import 'package:hospital_app/Doctor%20Login/WaitList/waitlist_model.dart';
import 'package:http/http.dart' as http;

import '../../Constant/constant.dart';

class WaitingListScreen extends StatefulWidget {
  final doctorName;
  const WaitingListScreen({Key? key, this.doctorName}) : super(key: key);

  @override
  State<WaitingListScreen> createState() => _WaitingListScreenState();
}

class _WaitingListScreenState extends State<WaitingListScreen> {
  final StreamController<WaitListModel> _streamController = StreamController();
  String todaysDate = DateTime.now().toString().substring(0, 10);


  @override
  void initState() {
    super.initState();
    print(todaysDate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        getWaitingList(DoctorDashBoard.doctorId.toString(), todaysDate);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }

  Future getWaitingList(String doctorId, String date) async {
    final endPoint = 'ShowPatientWaittingList?DrId=$doctorId&Date=$date';
    try {
      final response =
          await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = WaitListModel.fromJson(jsonData);
        print(data);
        _streamController.sink.add(data);
        //return data.waitList;
      } else {
        print('API Failed');
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    print('reloaded');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Waitlist',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.teal));
                  default:
                    if (snapshot.hasError) {
                      return const Text('Please Wait...');
                    } else {
                      final waitinglist = snapshot.data!.waitList;
                      return Expanded(
                          child: ListView.builder(
                              itemCount: waitinglist?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  height: 90,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blueGrey.shade50,
                                          width: 3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            waitinglist![index]['PatientName']
                                                .toString()
                                                .substring(0, 16),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            waitinglist[index]['PatientCode'],
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 75,
                                            decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        Colors.teal.shade200)),
                                            child: Center(
                                              child: Text(
                                                'Age :' +
                                                    waitinglist[index]['Age'],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            waitinglist[index]['DOCTOR_NAME']
                                                .toString()
                                                .substring(0, 10),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.teal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }));
                    }
                }
              })
        ],
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hospital_app/Doctor%20Login/DOCTOR%20DASHBOARD/doctor_dashBoard.dart';
// import 'package:hospital_app/Doctor%20Login/WaitList/wait_list_bloc.dart';
//
// class WaitingListScreen extends StatefulWidget {
//   final String? doctorName;
//   const WaitingListScreen({
//     Key? key,
//     this.doctorName,
//   }) : super(key: key);
//
//   @override
//   State<WaitingListScreen> createState() => _WaitingListScreenState();
// }
//
// class _WaitingListScreenState extends State<WaitingListScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   String todaysDate = DateTime.now().toString().substring(0, 10);
//
//   @override
//   Widget build(BuildContext context) {
//     print('Reloaded');
//     return BlocProvider(
//       create: (context) => WaitListBloc()
//         ..add(FetchWaitingList(
//             doctorID: DoctorDashBoard.doctorId, date: todaysDate)),
//       //todo
//       child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             elevation: 0,
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             iconTheme: const IconThemeData(color: Colors.black),
//             title: const Text(
//               'Waitilist',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 BlocListener<WaitListBloc, WaitListState>(
//                   listener: (context, state) {
//                     // TODO: implement listener}
//                   },
//                   child: BlocBuilder<WaitListBloc, WaitListState>(
//                     builder: (context, state) {
//                       if (state is WaitListLoadingState) {
//                         return const Center(
//                             child:
//                                 CircularProgressIndicator(color: Colors.teal));
//                       }
//                       if (state is WaitListLoadedState) {
//                         final waitinglist = state.waitList;
//                         return Expanded(
//                             child: ListView.builder(
//                                 itemCount: waitinglist.length,
//                                 itemBuilder: (context, index) {
//                                   return Container(
//                                     margin: const EdgeInsets.all(10),
//                                     padding: const EdgeInsets.all(10),
//                                     height: 90,
//                                     width: MediaQuery.of(context).size.width,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: Colors.blueGrey.shade50,
//                                             width: 3),
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               waitinglist[index]['PatientName']
//                                                   .toString()
//                                                   .substring(0, 16),
//                                               style: const TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text(
//                                               waitinglist[index]['PatientCode'],
//                                               style: const TextStyle(
//                                                   color: Colors.grey),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 12),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Container(
//                                               height: 24,
//                                               width: 75,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.teal,
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                   border: Border.all(
//                                                       color: Colors
//                                                           .teal.shade200)),
//                                               child: Center(
//                                                 child: Text(
//                                                   'Age :' +
//                                                       waitinglist[index]['Age'],
//                                                   style: const TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 10,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             Text(
//                                               waitinglist[index]['DOCTOR_NAME']
//                                                   .toString()
//                                                   .substring(0, 10),
//                                               style: const TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.teal),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }));
//                       }
//                       return const Center(
//                         child: Text('No Waiting List Available'),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
