import 'package:flutter/material.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';

import '../../Doctor/DoctorServices/doctor_services.dart';

class SearchDoctors extends StatefulWidget {
  const SearchDoctors({Key? key}) : super(key: key);

  @override
  State<SearchDoctors> createState() => _SearchDoctorsState();
}

class _SearchDoctorsState extends State<SearchDoctors> {
  @override
  void initState() {
    super.initState();
    getHospitalName();
  }

  HospitalServices hospitalServices = HospitalServices();
  DoctorServices doctorServices = DoctorServices();
  List<String> doctorList = [];
  String? rowId;
  int? unitId;
  List<String> lisOfHospital = [];

  getHospitalName() async {
    lisOfHospital = (await hospitalServices.getHospitalList())!;
  }

  getDoctorList(int docId) async {
    print('This is Doctor ID' '$docId');
    doctorList = (await doctorServices.getDoctorList(docId))!;
    print(doctorList);
  }

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
                              title: Autocomplete(
                                optionsBuilder: (TextEditingValue value) {
                                  return lisOfHospital
                                      .where((element) => element
                                          .toLowerCase()
                                          .contains(value.text.toLowerCase()))
                                      .toList();
                                },
                                // fieldViewBuilder: (BuildContext context,
                                //         TextEditingController controller,
                                //         FocusNode node,
                                //         Function onSubmit) =>
                                //     TextField(
                                //   controller: controller,
                                //   decoration: const InputDecoration(
                                //       hintText: 'Choose Hospital'),
                                // ),
                                onSelected: (value) {
                                  setState(() {
                                    rowId = value.substring(0, 1);
                                    int c = int.parse(rowId!);
                                    getDoctorList(c);
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 60,
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: ListTile(
                                leading: const Icon(Icons.search),
                                title: Autocomplete(
                                    optionsBuilder: (TextEditingValue value) {
                                  return doctorList
                                      .where((element) => element
                                          .toLowerCase()
                                          .contains(value.text.toLowerCase()))
                                      .toList();
                                })),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              height: 60,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () async {},
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
