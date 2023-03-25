class SafeXPayPaymentCallback {
  void onPaymentComplete(String orderID, String transactionID, String paymentID,
      String paymentStatus, String date, String time, String paymode ,String amount ,String udf1 ,String udf2 ,String udf3 ,String udf4 ,String udf5) {}

  void onPaymentCancelled() {}

  void onInitiatePaymentFailure(
      String orderID,
      String transactionID,
      String paymentID,
      String paymentStatus,
      String date,
      String time,
      String paymode,
      String amount ,
      String udf1 ,
      String udf2 ,
      String udf3 ,
      String udf4 ,
      String udf5) {}
}
