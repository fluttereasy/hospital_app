import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_list_bloc.dart';

class SearchDoctors extends StatefulWidget {
  const SearchDoctors({Key? key}) : super(key: key);

  @override
  State<SearchDoctors> createState() => _SearchDoctorsState();
}

class _SearchDoctorsState extends State<SearchDoctors> {
  HospitalServices hospitalServices = HospitalServices();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalListBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Book Appointment',
            style: TextStyle(),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.blue[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Search Doctors',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3E7BD8)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<HospitalListBloc, HospitalListState>(
                        builder: (context, state) {
                          return TextFormField(
                            onTap: () {
                              context
                                  .read<HospitalListBloc>()
                                  .add(HospitalListLoadingEvent());
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Search for Hospitals',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                                prefixIcon: const Icon(Icons.search_rounded)),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Choose Speciality or Doctors',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            prefixIcon: const Icon(Icons.search_rounded)),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () async {
                              final data =
                                  await hospitalServices.getHospitalList();
                              print(data[3].hospitalName.toString());
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0))),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
