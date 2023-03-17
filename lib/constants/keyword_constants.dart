class KeywordConstants{
  /// Extra Bundle key passed to SAFEXPAY SDK.
  static const String PAYMENT_BUNDLE = "payment_bundle";

  /// Extra Bundle key for Order No which is passed back from SDK.
  static const String ORDER_NO = "orderNo";

  /// Extra key for the {@link Order} object that is sent through Bundle.
  static const String ORDER = "order";

  /// Activity request code
  static const int REQUEST_CODE = 9;

  /// Internal key for all transactions
  static const String internalKey = "HiktfH0Mhdla4zDg0/4ASwFQh2OS+nf9MVL0ik3DsmE=";

  /// key for the Juspay card URL
  static const String URL = "url";

  /// Key for the merchant ID for the current transaction
  static const String MERCHANT_ID = "merchantId";

  /// Key for the success Url for the current transaction
  static const String SUCCESS_URL = "successUrl";

  /// Key for the failure Url for the current transaction
  static const String FAILURE_URL = "failureUrl";

  /// Key for the countryCode for the current transaction
  static const String COUNTRY_CODE = "countryCode";

  /// Key for the AMOUNT for the current transaction
  static const String AMOUNT = "amount";

  /// Key for the CURRENCY for the current transaction
  static const String CURRENCY = "currency";

  /// Key for the transaction type for the current transaction
  static const String TXNTYPE = "txn_type";

  /// Key for the CHANNEL for the current transaction
  static const String CHANNEL = "channel";

  /// Key for the merchant KEY for the current transaction
  static const String MERCHANT_KEY = "merchantKey";

  /// Key for the aggregator ID for the current transaction
  static const String AGGREGATOR_ID = "aggregator_id";

  /// Key for Netbanking Data passed to Juspay
  static const String POST_DATA = "postData";

  /// Key for transactionID in the return bundle
  static const String TRANSACTION_ID = "transactionID";

  /*
     * Key for paymentID in the return bundle
     */
  static const String PAYMENT_ID = "paymentID";

  static const String PAYMENT_STATUS_SUCCESS = "SUCCESS";

  /// Status code for UPI Pending Authentication
  static const int PENDING_PAYMENT = 2;

  static const String KEY_CODE = "code";

  static const String KEY_MESSGE = "message";
}