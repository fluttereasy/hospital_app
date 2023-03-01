import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:hospital_app/Patient%20Details/patient_details_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final formKey = GlobalKey<FormState>();

  //Validate mobile NUmber
  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? gender;
  String? patientAge;

  TextEditingController patientProblemController = TextEditingController();
  final countryPicker = const FlCountryCodePicker();
  // FlCountryCodePicker? countryCodePicker;
  CountryCode? countryCode;
  int age = 5;
  int radioValueBUtton = -1;

  @override
  Widget build(BuildContext context) {
    print(gender);
    print(age);
    print(nameController.text);
    return BlocProvider(
      create: (context) => PatientDetailsBloc(),
      child: Scaffold(
        bottomNavigationBar:
        BlocBuilder<PatientDetailsBloc, PatientDetailsState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    print('Submitting form');
                  }
                  // context.read<PatientDetailsBloc>().add(
                  //     SendPatientDetailsEvent(
                  //         patientName: nameController.text,
                  //         age: age.toString(),
                  //         phoneNumber: phoneNumberController.text,
                  //         gender: gender,
                  //         emailID: emailController.text));
                },
                child: const SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text(
            'Patient Details',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      'Full Name',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (value){
                          formKey.currentState!.validate();
                        },
                          validator: (value){
                            if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                              return "Enter Name without special characters";
                            }else{
                              return null;
                            }
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ))),
                      const SizedBox(height: 10),
                      const Text('Select age range ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Slider(
                        label: 'Select age',
                        value: age.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            age = value.toInt();
                          });
                        },
                        min: 5,
                        max: 100,
                      ),
                      Center(
                          child: Text(
                            'Age ${age.toString()}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Phone Number',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (value){
                          formKey.currentState!.validate();
                        },
                        validator: (value){
                          if(value!.isEmpty ){
                            return "Mobile number is required";
                          }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                            return 'Enter Correct Number';
                          }
                        },
                          controller: phoneNumberController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Phone Number',
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
                                                              color:
                                                              Colors.green),
                                                        ),
                                                      )),
                                                  Container(
                                                    height: 100,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                20.0),
                                                            bottomLeft: Radius
                                                                .circular(
                                                                20.0))),
                                                    child: Center(
                                                      child: PinCodeFields(
                                                        length: 6,
                                                        fieldBorderStyle:
                                                        FieldBorderStyle
                                                            .square,
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
                                                        textStyle:
                                                        const TextStyle(
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
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 50,
                                                            child: const Center(
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
                                                              print(
                                                                  "+91${phoneNumberController.text}");
                                                            } else {
                                                              //todo
                                                              print(
                                                                  "${countryCode?.dialCode}${phoneNumberController.text}");
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 50,
                                                            child: const Center(
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
                              prefixIcon: GestureDetector(
                                onTap: () async {
                                  final code = await countryPicker.showPicker(
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 6),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                BorderRadius.circular(10.0)),
                                            child: Text(
                                              countryCode?.dialCode ?? '+91',
                                              style: const TextStyle(
                                                  color: Colors.white,
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ))),
                      const SizedBox(height: 15),
                      const Text(
                        'Gender',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: const Text("Male"),
                            leading: Radio(
                              value: 1,
                              groupValue: radioValueBUtton,
                              onChanged: (value) {
                                setState(() {
                                  gender = 'Male';
                                  print(gender);
                                  radioValueBUtton = value!;
                                });
                              },
                              activeColor: Colors.red,
                            ),
                          ),
                          ListTile(
                            title: const Text("Female"),
                            leading: Radio(
                              value: 2,
                              groupValue: radioValueBUtton,
                              onChanged: (value) {
                                setState(() {
                                  gender = 'Female';
                                  print(gender);
                                  radioValueBUtton = value!;
                                });
                              },
                              activeColor: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'E-Mail Address',
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: emailController,
                        minLines: 1,
                        maxLines: null,
                      )
                    ],
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
