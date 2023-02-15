import 'package:flutter/material.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';

import '../../Doctor/HospitalServices/hospital_model.dart';

class SearchDoctors extends StatefulWidget {
  const SearchDoctors({Key? key}) : super(key: key);

  @override
  State<SearchDoctors> createState() => _SearchDoctorsState();
}

class _SearchDoctorsState extends State<SearchDoctors> {
  HospitalServices hospitalServices = HospitalServices();

  List<String> hospitalList = ['Sawan' , 'India', 'Alpha', 'Charlie'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Book Appointment',
            style: TextStyle(),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[100],
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Search Doctors',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3E7BD8)),
                          ),
                          Container(
                            height: 60,
                            margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.search),
                              title: Autocomplete<String>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return hospitalList.where((String items) {
                                    return items.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                onSelected: (String item) {
                                  print(item.toLowerCase());
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 60,
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.search),
                              title: Autocomplete<String>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return hospitalList.where((String items) {
                                    return items.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                onSelected: (String item) {
                                  print(item.toLowerCase());
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              height: 60,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final data =
                                      await hospitalServices.getHospitalList();
                                  print(data![3].hospitalName.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0))),
                                child: const Center(
                                    child: Text(
                                  'Book Appointment',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
            ])));
  }
}

//import 'package:flutter/material.dart';
// import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';
//
// class SearchDoctors extends StatefulWidget {
//   const SearchDoctors({Key? key}) : super(key: key);
//
//   @override
//   State<SearchDoctors> createState() => _SearchDoctorsState();
// }
//
// class _SearchDoctorsState extends State<SearchDoctors> {
//   HospitalServices hospitalServices = HospitalServices();
//
//   List<String> hospitalList = ['Sawan', 'India', ' Alpha', 'Charlie'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: const Text(
//             'Book Appointment',
//             style: TextStyle(),
//           ),
//           backgroundColor: Colors.blue,
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//               Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.blue[100],
//                   child: Column(children: [
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(10, 100, 10, 0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Search Doctors',
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xff3E7BD8)),
//                           ),
//                           Container(
//                             height: 60,
//                             margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(40),
//                               color: Colors.white,
//                             ),
//                             child: ListTile(
//                               leading: const Icon(Icons.search),
//                               title: Autocomplete<String>(
//                                 optionsBuilder:
//                                     (TextEditingValue textEditingValue) {
//                                   if (textEditingValue.text == '') {
//                                     return const Iterable<String>.empty();
//                                   }
//                                   return hospitalList.where((String items) {
//                                     return items.contains(
//                                         textEditingValue.text.toLowerCase());
//                                   });
//                                 },
//                                 onSelected: (String item) {
//                                   print(item.toLowerCase());
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//                             height: 60,
//                             margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(40),
//                               color: Colors.white,
//                             ),
//                             child: ListTile(
//                               leading: const Icon(Icons.search),
//                               title: Autocomplete<String>(
//                                 optionsBuilder:
//                                     (TextEditingValue textEditingValue) {
//                                   if (textEditingValue.text == '') {
//                                     return const Iterable<String>.empty();
//                                   }
//                                   return hospitalList.where((String items) {
//                                     return items.contains(
//                                         textEditingValue.text.toLowerCase());
//                                   });
//                                 },
//                                 onSelected: (String item) {
//                                   print(item.toLowerCase());
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Center(
//                             child: SizedBox(
//                               height: 60,
//                               width: 250,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   final data =
//                                       await hospitalServices.getHospitalList();
//                                   print(data[3].hospitalName.toString());
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(40.0))),
//                                 child: const Center(
//                                     child: Text(
//                                   'Book Appointment',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 )),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ]))
//             ])));
//   }
// }
