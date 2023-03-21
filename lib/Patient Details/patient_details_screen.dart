import 'dart:math';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:hospital_app/Doctor/find_doctors.dart';
import 'package:hospital_app/Patient%20Details/patient_details_bloc.dart';
import 'package:hospital_app/Screens/Dashboard/dashboard_screen.dart';
import '../Doctors and Speciality/Hospital for Speciality/Doctor List After Speciality/doctor_list_screen.dart';
import '../Screens/Appointment Timing/ScheduleAppointment.dart';
import '../merchant_hosted_safexpay.dart';
import '../observer/safeXPay_payment_callback.dart';
import '../observer/safeXPay_payment_callback_observable.dart';
import '../safexpay.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);
  static String ?numberforOnlinePayment;
  static String ?nameForOnlinePayment;
  static String ?emailForOnlinePayment;
  static String ?ageForOnlinePayment;
  static String ?genderForOnlinePayment;
  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails>
    implements SafeXPayPaymentCallback {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? gender;
  String? patientAge;
  String _paymentOption = 'Pay Now';

  TextEditingController controller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SafeXPayPaymentCallbackObservable _safeXPayPaymentCallbackObservable;

  @override
  void initState() {
    super.initState();
    _safeXPayPaymentCallbackObservable = SafeXPayPaymentCallbackObservable();
    _safeXPayPaymentCallbackObservable.register(this);
  }

  TextEditingController patientProblemController = TextEditingController();
  final countryPicker = const FlCountryCodePicker();
  // FlCountryCodePicker? countryCodePicker;
  CountryCode? countryCode;
  int age = 5;
  int radioValueBUtton = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientDetailsBloc(),
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar:
            BlocListener<PatientDetailsBloc, PatientDetailsState>(
          listener: (context, state) {
            if (state is PatientDetailsInserting) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Booking Appointment please wait')));
            }
            if (state is PatientDetailsInserted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  margin: EdgeInsets.all(20),
                  behavior: SnackBarBehavior.floating,
                  elevation: 10,
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  content: Text(
                    'Appointment Booked',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )));
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen(),
                      maintainState: true),
                  (Route<dynamic> route) => false);
            }
            // TODO: implement listener
          },
          child: BlocBuilder<PatientDetailsBloc, PatientDetailsState>(
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //Bloc Event Call
                      if (_paymentOption == 'Pay at Hospital') {
                        context.read<PatientDetailsBloc>().add(
                            SendDateTimeEvent(
                                doctorID:
                                    DoctorListScreen.doctorIDForSubmitting,
                                unitID: SearchDoctors.unitID.toString(),
                                datTime: ScheduleAppointment
                                    .dateTimeForSubmitting
                                    .toString()));

                        context
                            .read<PatientDetailsBloc>()
                            .add(SendPatientDetailsEvent(
                              patientName: nameController.text,
                              age: age.toString(),
                              gender: gender,
                              emailID: emailController.text,
                              phoneNumber: phoneNumberController.text,
                            ));

                        //==============================================

                        context.read<PatientDetailsBloc>().add(
                            SendPatientDetailstoOnlineAPpointment(
                                firstName: nameController.text,
                                age: age.toString(),
                                phoneNumber: phoneNumberController.text,
                                gender: gender,
                                emailID: emailController.text,
                                charges: DoctorListScreen.chargesForSubmitting,
                                chargesType:
                                    DoctorListScreen.chargesTypeForSubmitting,
                                unitID: SearchDoctors.unitID.toString(),
                                doctorID:
                                    DoctorListScreen.doctorIDForSubmitting,
                                dateTime:
                                    ScheduleAppointment.dateTimeForSubmitting));
                      } else if (_paymentOption == 'Pay Now') {
                        setState(() {
                          // getting value for pay now screen
                          PatientDetails.numberforOnlinePayment = phoneNumberController.text;
                          PatientDetails.nameForOnlinePayment = nameController.text;
                          PatientDetails.emailForOnlinePayment = emailController.text;
                          PatientDetails.genderForOnlinePayment = gender;
                          PatientDetails.ageForOnlinePayment = age.toString();
                        });
                        MHSafeXPayGateway safeXPayGateway = MHSafeXPayGateway(
                            orderNo: '${Random().nextInt(1000)}',
                            amount: double.parse(
                                DoctorListScreen.consultantCharges),
                            currency: 'INR',
                            transactionType: 'SALE',
                            channel: 'MOBILE',
                            successUrl:
                                'http://localhost/safexpay/response.php',
                            failureUrl:
                                'http://localhost/safexpay/response.php',
                            countryCode: 'IND',
                            pgDetails: '|||',
                            customerDetails: '||||',
                            cardDetails: '||||',
                            billDetails: '||||',
                            shipDetails: '||||||',
                            itemDetails: '||',
                            upiDetails: '',
                            otherDetails: '||||');
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) => safeXPayGateway);
                        Navigator.push(context, route);
                      }
                    }
                  },
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                        child: Text(
                      'BOOK APPOINTMENT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ));
            },
          ),
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
                const SizedBox(height: 5),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                          onChanged: (value) {
                            formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return "Enter Name without special characters";
                            } else {
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
                      const Text('Select age',
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
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          onChanged: (value) {
                            formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Mobile number is required";
                            } else if (!RegExp(
                                    r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                .hasMatch(value)) {
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
                                              padding:
                                                  const EdgeInsets.all(16.0),
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
                                                                  FontWeight
                                                                      .bold,
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
                                                                bottomRight: Radius
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
                                                            BorderRadius
                                                                .circular(20.0),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
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
                                                        MainAxisAlignment
                                                            .center,
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
                                                            } else {
                                                              //todo
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                                      width: 8,
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
                                    const SizedBox(width: 8),
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
                                                    BorderRadius.circular(
                                                        10.0)),
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
                      const SizedBox(height: 10),
                      const Text(
                        'Gender',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: emailController,
                        minLines: 1,
                        maxLines: null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Payment Summary',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: ListTile(
                          title: const Text(
                            'Pay Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          selectedTileColor: Colors.blue[200],
                          trailing: Text(
                            'Rs ${DoctorListScreen.consultantCharges}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          leading: Radio(
                              value: 'Pay Now',
                              groupValue: _paymentOption,
                              onChanged: (value) {
                                setState(() {
                                  _paymentOption = value!;
                                });
                              }),
                          onTap: () {
                            setState(() {
                              _paymentOption = "Pay Now";
                            });
                          },
                          selected: _paymentOption == "Pay Now",
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: ShapeDecoration(
                          shape: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: ListTile(
                          title: const Text(
                            'Pay at Hospital',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          trailing: Text(
                            DoctorListScreen.consultantCharges != null
                                ? 'Rs ${DoctorListScreen.consultantCharges}'
                                : '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          selectedTileColor: Colors.blue[200],
                          leading: Radio(
                            value: 'Pay at Hospital',
                            groupValue: _paymentOption,
                            onChanged: (value) {
                              setState(() {
                                _paymentOption = value!;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _paymentOption = 'Pay at Hospital';
                            });
                          },
                          selected: _paymentOption == 'Pay at Hospital',
                        ),
                      ),
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

  @override
  void onInitiatePaymentFailure(
      String orderID,
      String transactionID,
      String paymentID,
      String paymentStatus,
      String date,
      String time,
      String paymode,
      String amount,
      String udf1,
      String udf2,
      String udf3,
      String udf4,
      String udf5) {
    print(
        'onInitiatePaymentFailure : $orderID -- $transactionID -- $paymentID -- $paymentStatus -- $date -- $time -- $paymode -- $amount -- $udf1 -- $udf2 -- $udf3 -- $udf4 -- $udf5');

    Utility.showSnackBarMessage(
        state: _scaffoldKey.currentState!,
        message:
            '$orderID -- $transactionID -- $paymentID -- $paymentStatus -- $date -- $time -- $paymode-- $amount -- $udf1 -- $udf2 -- $udf3 -- $udf4 -- $udf5');
  }

  @override
  void onPaymentCancelled() {
    Utility.showSnackBarMessage(
        state: _scaffoldKey.currentState!, message: 'Transaction Cancelled');

    print('onPaymentCancelled : Transaction Cancelled');
  }

  @override
  void onPaymentComplete(
      String orderID,
      String transactionID,
      String paymentID,
      String paymentStatus,
      String date,
      String time,
      String paymode,
      String amount,
      String udf1,
      String udf2,
      String udf3,
      String udf4,
      String udf5) {
    print(
        'onPaymentComplete : $orderID -- $transactionID -- $paymentID -- $paymentStatus -- $date -- $time -- $paymode -- $amount -- $udf1 -- $udf2 -- $udf3 -- $udf4 -- $udf5');
    Utility.showSnackBarMessage(
        state: _scaffoldKey.currentState!,
        message:
            '$orderID -- $transactionID -- $paymentID -- $paymentStatus -- $date -- $time -- $paymode -- $amount -- $udf1 -- $udf2 -- $udf3 -- $udf4 -- $udf5');
  }
}
