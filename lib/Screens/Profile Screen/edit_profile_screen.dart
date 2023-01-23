import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

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

  final TextEditingController _dobController = TextEditingController(text: "");

  final TextEditingController nameController =
      TextEditingController(text: "Andrew Ainsley");

  final TextEditingController _emailController =
      TextEditingController(text: "andrewainsley@gmail.com");

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
    return Scaffold(
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
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    hintColor: Colors.transparent,
                  ),
                  child: TextFormField(
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
                    controller: _dobController,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2030));
                      setState(() {
                      });
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
                          child: const Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.black,
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
                    controller: _emailController,
                    decoration: InputDecoration(
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
              const SizedBox(height: 200),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0)),
                child: const Center(
                    child: Text(
                  'Update',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
