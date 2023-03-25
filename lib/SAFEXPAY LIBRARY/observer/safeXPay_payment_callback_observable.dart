import 'package:flutter/material.dart';
import 'package:hospital_app/Patient%20Details/patient_details_bloc.dart';
import 'package:hospital_app/SAFEXPAY%20LIBRARY/observer/safeXPay_payment_callback.dart';
import '../../Doctor/find_doctors.dart';
import '../../Doctors and Speciality/Hospital for Speciality/Doctor List After Speciality/doctor_list_screen.dart';
import '../../Patient Details/patient_details_screen.dart';
import '../../Screens/Appointment Timing/ScheduleAppointment.dart';
import 'observable.dart';

class SafeXPayPaymentCallbackObservable
    implements Observable<SafeXPayPaymentCallback> {
  static List<SafeXPayPaymentCallback> _observerList =
      <SafeXPayPaymentCallback>[];

  @override
  void register(SafeXPayPaymentCallback observer) {
    if (!_observerList.contains(observer)) {
      _observerList.add(observer);
    }
  }

  @override
  void unRegister(SafeXPayPaymentCallback observer) {
    if (_observerList.contains(observer)) {
      _observerList.remove(observer);
    }
  }

  void notifyOnPaymentComplete(
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
    // calling bloc event to add booking details
    PatientDetailsBloc patientDetailsBloc = PatientDetailsBloc();
    patientDetailsBloc.add(SendPatientDetailsEvent(
      patientName: PatientDetails.nameForOnlinePayment,
      age: PatientDetails.ageForOnlinePayment,
      gender: PatientDetails.genderForOnlinePayment,
      emailID: PatientDetails.emailForOnlinePayment,
      phoneNumber: PatientDetails.numberforOnlinePayment,
    ));

    //caling bloc to add booking details DateTime
    patientDetailsBloc.add(SendDateTimeEvent(
        doctorID: DoctorListScreen.doctorIDForSubmitting,
        unitID: SearchDoctors.unitID.toString(),
        datTime: ScheduleAppointment.dateTimeForSubmitting.toString()));

    //Calling Bloc Event for Adding booking details in
    patientDetailsBloc.add(SendPatientDetailstoOnlineAPpointment(
        firstName: PatientDetails.nameForOnlinePayment,
        age: PatientDetails.ageForOnlinePayment,
        phoneNumber: PatientDetails.numberforOnlinePayment,
        emailID: PatientDetails.emailForOnlinePayment,
        charges: DoctorListScreen.chargesForSubmitting,
        chargesType: DoctorListScreen.chargesTypeForSubmitting,
        unitID: SearchDoctors.unitID.toString(),
        doctorID: DoctorListScreen.doctorIDForSubmitting,
        dateTime: ScheduleAppointment.dateTimeForSubmitting));

    for (final SafeXPayPaymentCallback observer in _observerList) {
      observer.onPaymentComplete(
          orderID,
          transactionID,
          paymentID,
          paymentStatus,
          date,
          time,
          paymode,
          amount,
          udf1,
          udf2,
          udf3,
          udf4,
          udf5);
    }
  }

  void notifyOnPaymentCancelled() {
    for (final SafeXPayPaymentCallback observer in _observerList) {
      observer.onPaymentCancelled();
    }
  }

  void notifyOnInitiatePaymentFailure(
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
    for (final SafeXPayPaymentCallback observer in _observerList) {
      observer.onInitiatePaymentFailure(
          orderID,
          transactionID,
          paymentID,
          paymentStatus,
          date,
          time,
          paymode,
          amount,
          udf1,
          udf2,
          udf3,
          udf4,
          udf5);
    }
  }
}
