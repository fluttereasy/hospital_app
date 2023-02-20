import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<String> countriesName = ['India', 'USA', 'CANADA', ' Australia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: ListTile(
                title: Autocomplete(
                  initialValue:
                      const TextEditingValue(text: 'Choose the Hospital'),
                  optionsBuilder: (TextEditingValue value) {
                    return countriesName
                        .where((element) => element
                            .toLowerCase()
                            .contains(value.text.toLowerCase()))
                        .toList();
                  },
                  // fieldViewBuilder: (BuildContext context,
                  //                               TextEditingController
                  //                                   controller,
                  //                               node,
                  //                               Function onSubmit) =>
                  //                           TextFormField(
                  //                         controller: controller,
                  //                         expands: false,
                  //                         decoration: const InputDecoration(
                  //                             hintText: 'Choose Hospital'),
                  //                       ),
                ),
                trailing: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              )),

        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hospital_app/Doctor/DoctorServices/doctor_bloc.dart';
// import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';
// import 'package:hospital_app/Doctor/HospitalServices/hospital_bloc.dart';
// import '../../Doctor/DoctorServices/doctor_services.dart';
//
// class TestScreen extends StatefulWidget {
//   const TestScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   HospitalServices hospitalServices = HospitalServices();
//   DoctorServices doctorServices = DoctorServices();
//
//   List<String> lisOfHospital = [];
//   List<String> listOfDoctor = [];
//   String? rowId;
//   int? parsedRowid;
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<HospitalBloc>(
//             create: (BuildContext context) =>
//             HospitalBloc()..add(HospitalLoadingEvent())),
//         BlocProvider<DoctorBloc>(
//             create: (BuildContext context) => DoctorBloc()),
//       ],
//       child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             title: const Text(
//               'Book Appointment',
//               style: TextStyle(),
//             ),
//             backgroundColor: Colors.blue,
//           ),
//           body: SingleChildScrollView(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                         height: MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context).size.width,
//                         color: Colors.blue[100],
//                         child: Column(children: [
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(10, 100, 10, 0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Search Doctors',
//                                   style: TextStyle(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xff3E7BD8)),
//                                 ),
//                                 Container(
//                                   height: 60,
//                                   margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(40),
//                                     color: Colors.white,
//                                   ),
//                                   child: ListTile(
//                                     leading: const Icon(Icons.search),
//                                     title: BlocBuilder<HospitalBloc, HospitalState>(
//                                       builder: (context, state) {
//                                         if (state is HospitalLoadedState) {
//                                           lisOfHospital = state.doctoList;
//                                           return Autocomplete(
//                                             optionsBuilder:
//                                                 (TextEditingValue value) {
//                                               return lisOfHospital
//                                                   .where((element) => element
//                                                   .toLowerCase()
//                                                   .contains(
//                                                   value.text.toLowerCase()))
//                                                   .toList();
//                                             },
//                                             onSelected: (value) {
//                                               //print(value);
//                                               rowId = value.substring(0, 1);
//                                               parsedRowid = int.parse(rowId!);
//                                               context.read<DoctorBloc>().add(
//                                                   DoctorLoadingEvent(parsedRowid));
//                                             },
//                                           );
//                                         }
//                                         return const SizedBox.shrink();
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Container(
//                                   height: 60,
//                                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(40),
//                                     color: Colors.white,
//                                   ),
//                                   child: ListTile(
//                                     leading: const Icon(Icons.search),
//                                     title: BlocConsumer<DoctorBloc, DoctorState>(
//                                       listener: (context, state) {},
//                                       builder: (context, state) {
//                                         return BlocBuilder<DoctorBloc, DoctorState>(
//                                           builder: (context, state) {
//                                             if (state is DoctorLoadedState) {
//                                               listOfDoctor = state.doctorList;
//                                               return Autocomplete(
//                                                 optionsBuilder:
//                                                     (TextEditingValue value) {
//                                                   return listOfDoctor
//                                                       .where((element) => element
//                                                       .toLowerCase()
//                                                       .contains(value.text
//                                                       .toLowerCase()))
//                                                       .toList();
//                                                 },
//                                                 onSelected: (value) {
//                                                   //print(value);
//                                                 },
//                                               );
//                                             }
//                                             return const SizedBox.shrink();
//                                           },
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Center(
//                                   child: SizedBox(
//                                       height: 60,
//                                       width: 250,
//                                       child:
//                                       BlocBuilder<HospitalBloc, HospitalState>(
//                                         builder: (context, state) {
//                                           return ElevatedButton(
//                                             onPressed: () {
//                                               // context.read<DoctorBloc>().add(AppointmentButtonCLicked(parsedRowid, doctorName)))
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(
//                                                         40.0))),
//                                             child: const Center(
//                                                 child: Text(
//                                                   'Book Appointment',
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.white),
//                                                 )),
//                                           );
//                                         },
//                                       )),
//                                 )
//                               ],
//                             ),
//                           )
//                         ]))
//                   ]))),
//     );
//   }
// }
//
// // BlocBuilder<DoctorBloc, DoctorState>(
// //                                   builder: (context, state) {
// //                                     if (state is DoctorLoadedState) {
// //                                       listOfDoctor = state.doctorList;
// //                                       return Autocomplete(
// //                                         optionsBuilder:
// //                                             (TextEditingValue value) {
// //                                           return listOfDoctor
// //                                               .where((element) => element
// //                                                   .toLowerCase()
// //                                                   .contains(
// //                                                       value.text.toLowerCase()))
// //                                               .toList();
// //                                         },
// //                                       );
// //                                     }
// //                                     return const SizedBox.shrink();
// //                                   },
// //                                 ),
//
// //Autocomplete(
//                                         // fieldViewBuilder: (BuildContext context,
//                                         //         TextEditingController
//                                         //             controller,
//                                         //         node,
//                                         //         Function onSubmit) =>
//                                         //     TextFormField(
//                                         //   controller: controller,
//                                         //   expands: false,
//                                         //   decoration: const InputDecoration(
//                                         //       hintText: 'Choose Hospital'),
//                                         // ),
// //                                         optionsBuilder:
// //                                             (TextEditingValue value) {
// //                                           return lisOfHospital
// //                                               .where((element) => element
// //                                                   .toLowerCase()
// //                                                   .contains(
// //                                                       value.text.toLowerCase()))
// //                                               .toList();
// //                                         },
// //                                         onSelected: (value) {
// //                                           rowId = value.substring(0, 1);
// //                                           parsedRowid = int.parse(rowId!);
// //                                           context.read<DoctorBloc>().add(
// //                                               DoctorLoadingEvent(parsedRowid));
// //                                         },
// //                                       );
