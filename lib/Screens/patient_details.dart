import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);
  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  TextEditingController phoneNumberController = TextEditingController();
  final countryPicker = const FlCountryCodePicker();
  FlCountryCodePicker? countryCodePicker;
  CountryCode? countryCode;
  int age = 5;
  String _value = 'Male';

  @override
  void initState() {
    final favouriteCountries = ['IN', 'US', 'CA'];
    countryCodePicker = FlCountryCodePicker(
        favorites: favouriteCountries,
        favoritesIcon: const Icon(
          Icons.star,
          color: Colors.amber,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {},
          child: Container(
            height: 50,
            child: const Center(
                child: Text(
              'NEXT',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
          )),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ))),
                  const SizedBox(height: 10),
                  const Text('Select age range ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      controller: phoneNumberController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Phone Number',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (countryCode == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please Choose Country Dial Code')));
                              }
                              if (countryCode != null) {}
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              height: 5,
                              width: 50,
                              color: Colors.blue,
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
                                      : null,
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    value: _value,
                    items: const [
                      //add items in the dropdown
                      DropdownMenuItem(value: "Male", child: Text("Male")),

                      DropdownMenuItem(
                        value: "Female",
                        child: Text("Female"),
                      ),

                      DropdownMenuItem(
                        value: "Others",
                        child: Text("Others"),
                      )
                    ],
                    onChanged: (value) {
                      //get value when changed
                      setState(() {
                        _value = _value;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Write Your Problems',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextFormField()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
