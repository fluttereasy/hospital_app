

import 'package:hospital_app/observer/safeXPay_payment_callback.dart';

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
    for (final SafeXPayPaymentCallback observer in _observerList) {
      observer.onPaymentComplete(orderID, transactionID, paymentID,
          paymentStatus, date, time, paymode, amount, udf1, udf2 , udf3, udf4 ,udf5);
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
      observer.onInitiatePaymentFailure(orderID, transactionID, paymentID,
          paymentStatus, date, time, paymode ,amount, udf1, udf2 , udf3, udf4 ,udf5);
    }
  }
}
