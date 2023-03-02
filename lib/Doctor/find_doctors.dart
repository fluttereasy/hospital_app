import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/hospital_for_speciality_bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/speciality_bloc.dart';
import '../Doctors and Speciality/Hospital for Speciality/Doctor List After Speciality/doctor_list_bloc.dart';
import '../Doctors and Speciality/Hospital for Speciality/Doctor List After Speciality/doctor_list_screen.dart';
import '../Doctors and Speciality/Hospital for Speciality/hospital_for_speciality_services.dart';

class SearchDoctors extends StatefulWidget {
  const SearchDoctors({Key? key}) : super(key: key);
  static int? unitID;
  static String? specialityofDoctors;
  @override
  State<SearchDoctors> createState() => _SearchDoctorsState();
}

class _SearchDoctorsState extends State<SearchDoctors> {
  HospitalForSpecialityServices hospitalForSpecialityServices =
      HospitalForSpecialityServices();

  List _allusers = [];
  List results = [];
  List _foundUsers = [];
  bool showSpecialList = false;
  bool showHospitalList = false;
  bool selectHospitals = false;
  int currentPage = 0;
  TextEditingController specialistController = TextEditingController();
  TextEditingController hosptalListController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  List? allHospitalUser = [];

  //This function is calls and filter data whenever the text field changes
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      results = _allusers;
    } else {
      results = _allusers;
      results = _allusers
          .where((element) => element['Speciality']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  //--------------------------------
  //----------------------------- --

  List resultofHospital = [];
  List foundHospitalUser = [];
  void _runFilterForHospital(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      resultofHospital = allHospitalUser!;
    } else {
      resultofHospital = allHospitalUser!;
      resultofHospital = allHospitalUser!
          .where((element) => element['UnitName']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundHospitalUser = resultofHospital;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  SpecialityBloc()..add(SpecialityListFetchEvent())),
          BlocProvider(create: (context) => HospitalForSpecialityBloc()),
          BlocProvider(create: (context) => DoctorListBloc())
        ],
        child: Scaffold(
          backgroundColor: const Color(0xff00b4db),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Appointment',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  height: 110,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'SELECT BY DOCTORS OR SPECIALITY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff025363),
                          fontSize: 26),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 33,
                  color: Colors.white,
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/hosBack.jpg'))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Speciality/Doctors',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            )),
                        const SizedBox(height: 8),
                        BlocBuilder<SpecialityBloc, SpecialityState>(
                          builder: (context, state) {
                            if (state is SpecialityLoadedState) {
                              _allusers = state.doctorSPecialityList;
                            }
                            return TextField(
                              controller: specialistController,
                              onChanged: (value) => _runFilter(value),
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Choose Doctors/Speciality',
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  )),
                              onTap: () {
                                setState(() {
                                  showSpecialList = true;
                                  showHospitalList = false;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        showSpecialList == true
                            ? Expanded(
                                child: Container(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _foundUsers.length,
                                    itemBuilder: (context, index) => Card(
                                        key: ValueKey(
                                            _foundUsers[index]["Speciality"]),
                                        color: Colors.green,
                                        elevation: 1,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0.5),
                                        child: ListTile(
                                          selectedColor: Colors.blue[100],
                                          tileColor: Colors.white,
                                          title: Text(
                                            _foundUsers[index]["Speciality"],
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          trailing: Text(
                                            _foundUsers[index]["Type"],
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () {
                                            specialistController.text =
                                                _foundUsers[index]
                                                    ["Speciality"];
                                            setState(() {
                                              SearchDoctors
                                                      .specialityofDoctors =
                                                  specialistController.text
                                                      .toString();
                                              showSpecialList = false;
                                            });
                                            context
                                                .read<
                                                    HospitalForSpecialityBloc>()
                                                .add(
                                                    HospitalsForspecialityLoadingEvent(
                                                        specialistController
                                                            .text));
                                          },
                                        )),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Hospitals',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            )),
                        const SizedBox(height: 8),
                        TextField(
                          controller: hosptalListController,
                          onChanged: (value) => _runFilterForHospital(value),
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Choose Hospital',
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                          onTap: () {
                            setState(() {
                              showHospitalList = true;
                              showSpecialList = false;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        BlocBuilder<HospitalForSpecialityBloc,
                            HospitalForSpecialityState>(
                          builder: (context, state) {
                            if (state is HospitalsLoadedState) {
                              allHospitalUser = state.data;
                              return showHospitalList == true
                                  ? Expanded(
                                      child: Container(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: foundHospitalUser.length,
                                          itemBuilder: (context, index) => Card(
                                              color: Colors.white,
                                              elevation: 1,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0.5),
                                              child: ListTile(
                                                selectedColor: Colors.blue[100],
                                                title: Text(
                                                    foundHospitalUser[index]
                                                        ['UnitName'],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                onTap: () {
                                                  setState(() {
                                                    SearchDoctors.unitID =
                                                        foundHospitalUser[index]
                                                            ['RowId'];
                                                    hosptalListController.text =
                                                        foundHospitalUser[index]
                                                            ['UnitName'];
                                                    showHospitalList = false;
                                                  });
                                                },
                                              )),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: SizedBox(
                            height: 45,
                            width: 180,
                            child: BlocBuilder<DoctorListBloc, DoctorListState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DoctorListScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff00b4db),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                    child: const Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3),
                                    ));
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
