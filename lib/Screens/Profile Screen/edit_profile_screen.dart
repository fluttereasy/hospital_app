import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_bloc.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_details_servcies.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_state.dart';
import 'ProfileJsonModel/profileModel.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController countryController =
      TextEditingController(text: 'India');

  DateTime selectedDate = DateTime.now();

  //DateTime variable
  TextEditingController dateController = TextEditingController(text: 'India');

  //function for picking the date
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2025));
  }

  ProfileDetailsServices profileDetailsServices = ProfileDetailsServices();
  ProfileModel profileModel = ProfileModel();

  final TextEditingController _dobController = TextEditingController(text: '');

  TextEditingController nameController = TextEditingController(text: "");

  final TextEditingController _emailController =
      TextEditingController(text: "");

  final TextEditingController _genderController =
      TextEditingController(text: "");

  TextEditingController phoneNumberController = TextEditingController(text: "");

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  // Initial Selected Value
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var items = ['Male', 'Female', 'Others'];

  final countryPicker = const FlCountryCodePicker();
  // FlCountryCodePicker? countryCodePicker;
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()
        ..add(ProfileLoadingEvent(mobileNumber: OtpScreen.numberForProfileScreen.toString())),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 105,
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('images/ml_doctor.png'),
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 90,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                //todo
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // Username TextFormField
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoadedState) {
                          final userName =
                              state.details.dataInfo!.patientName.toString();
                          nameController.text = userName;
                          return Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(userName.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              ));
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // DOB TextFormField------------------
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoadedState) {
                          final dob = state.details.dataInfo!.dob.toString();
                          _dobController.text = dob.toString();
                          return TextFormField(
                            controller: _dobController,
                            onTap: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(1800),
                                  lastDate: DateTime.now());
                              if (pickedDate != null ||
                                  pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate!;
                                  var date =
                                      '${pickedDate.toLocal().day}-${pickedDate.toLocal().month}-${pickedDate.toLocal().year}';
                                  _dobController.text = date;
                                });
                              }
                            },
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    _showDatePicker();
                                  },
                                  child: InkWell(
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: selectedDate,
                                              firstDate: DateTime(1800),
                                              lastDate: DateTime.now());
                                      if (pickedDate != null ||
                                          pickedDate != selectedDate) {
                                        setState(() {
                                          selectedDate = pickedDate!;
                                          var date =
                                              '${pickedDate.toLocal().day}-${pickedDate.toLocal().month}-${pickedDate.toLocal().year}';
                                          _dobController.text = date;
                                        });
                                      }
                                    },
                                    child: const Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ))),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoadedState) {
                          final email =
                              state.details.dataInfo!.email.toString();
                          _emailController.text = email;
                          return TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ))),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: TextFormField(
                      controller: countryController,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 1),
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down,
                            size: 35,
                            color: Colors.black,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Sawan',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      controller: _genderController,
                      decoration: InputDecoration(
                          suffixIcon: Container(
                            color: Colors.transparent,
                            margin: const EdgeInsets.all(15),
                            child: DropdownButton(
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  _genderController.text = newValue!;
                                });
                              },
                            ),
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ))),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // SizedBox(
                //   height: 50,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(40.0))),
                //     child: const Center(
                //         child: Text(
                //       'Update',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     )),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 child: Theme(
//                   data: Theme.of(context).copyWith(
//                     hintColor: Colors.transparent,
//                   ),
//                   child: BlocBuilder<ProfileBloc, ProfileState>(
//                     builder: (context, state) {
//                       if (state is ProfileLoadedState) {
//                         final dob = state.details.dataInfo!.dob.toString();
//                         _dobController.text = dob.toString();
//                         return TextFormField(
//                           controller: _dobController,
//                           onTap: () async {
//                             final DateTime? pickedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: selectedDate,
//                                 firstDate: DateTime(1800),
//                                 lastDate: DateTime.now());
//                             if (pickedDate != null ||
//                                 pickedDate != selectedDate) {
//                               setState(() {
//                                 selectedDate = pickedDate!;
//                                 var date =
//                                     '${pickedDate.toLocal().day}-${pickedDate.toLocal().month}-${pickedDate.toLocal().year}';
//                                 _dobController.text = date;
//                               });
//                             }
//                           },
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                           decoration: InputDecoration(
//                               suffixIcon: InkWell(
//                                 onTap: () {
//                                   _showDatePicker();
//                                 },
//                                 child: InkWell(
//                                   onTap: () async {
//                                     final DateTime? pickedDate =
//                                         await showDatePicker(
//                                             context: context,
//                                             initialDate: selectedDate,
//                                             firstDate: DateTime(1800),
//                                             lastDate: DateTime.now());
//                                     if (pickedDate != null ||
//                                         pickedDate != selectedDate) {
//                                       setState(() {
//                                         selectedDate = pickedDate!;
//                                         var date =
//                                             '${pickedDate.toLocal().day}-${pickedDate.toLocal().month}-${pickedDate.toLocal().year}';
//                                         _dobController.text = date;
//                                       });
//                                     }
//                                   },
//                                   child: const Icon(
//                                     Icons.calendar_month_rounded,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               fillColor: Colors.grey[200],
//                               filled: true,
//                               border: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(90.0)),
//                                   borderSide: BorderSide(
//                                     color: Colors.transparent,
//                                   ))),
//                         );
//                       }
//                       return Container();
//                     },
//                   ),
//                 ),
//               ),
