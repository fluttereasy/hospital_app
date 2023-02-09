import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
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

  final TextEditingController _dobController = TextEditingController();

  TextEditingController nameController = TextEditingController(text: "");

  final TextEditingController _emailController =
      TextEditingController(text: "");

  final TextEditingController _genderController =
      TextEditingController(text: "Male");

  TextEditingController phoneNumberController =
      TextEditingController(text: "7982287675");

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
      create: (context) => ProfileBloc()..add(ProfileLoadingEvent()),
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
                          return TextFormField(
                            controller: nameController,
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

                // DOB TextFormField--------------------
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
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      hintColor: Colors.transparent,
                    ),
                    child: TextFormField(
                      controller: phoneNumberController,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () async {
                              final code = await countryPicker.showPicker(
                                  initialSelectedLocale: "IN",
                                  context: context);
                              setState(() {
                                countryCode = code;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: countryCode != null
                                      ? countryCode!.flagImage
                                      : Image.asset(
                                          'images/india.jpg',
                                          height: 25,
                                          width: 30,
                                        ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 6),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Text(
                                          countryCode?.dialCode ?? '+91',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 100,
                                                  width: double.infinity,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      20.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20.0))),
                                                  child: const Center(
                                                    child: Text(
                                                      'Verify OTP',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 30,
                                                          color: Colors.green),
                                                    ),
                                                  )),
                                              Container(
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0))),
                                                child: Center(
                                                  child: PinCodeFields(
                                                    length: 6,
                                                    fieldBorderStyle:
                                                        FieldBorderStyle.square,
                                                    responsive: false,
                                                    fieldHeight: 30.0,
                                                    fieldWidth: 30.0,
                                                    borderWidth: 2.0,
                                                    activeBorderColor:
                                                        Colors.teal,
                                                    activeBackgroundColor:
                                                        Colors.tealAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    autoHideKeyboard: false,
                                                    fieldBackgroundColor:
                                                        Colors.white,
                                                    borderColor:
                                                        Colors.lightGreen,
                                                    textStyle: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    onComplete: (output) {
                                                      // Your logic with pin code
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const SizedBox(
                                                        height: 40,
                                                        width: 50,
                                                        child: Center(
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 30),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        //by default the dial code will be set to India
                                                        //TODO
                                                        if (countryCode ==
                                                            null) {
                                                          //todo
                                                        } else {
                                                          //todo
                                                        }
                                                      },
                                                      child: const SizedBox(
                                                        height: 40,
                                                        width: 50,
                                                        child: Center(
                                                          child: Text(
                                                            'Verify',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Center(
                                  child: Text(
                                'OTP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
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
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0))),
                    child: const Center(
                        child: Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
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
