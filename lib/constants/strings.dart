enum Environment {TEST, PRODUCTION}
class StringConstants{
  static const String app_name = 'SafeXPay';

  static const String label_name = 'Enter Name';
  static const String label_email = 'Enter Email ID';
  static const String label_mobile = 'Enter Mobile Number';

  static const String name_empty_msg = 'Enter Name';

  static const String valid_email_msg = 'Enter a valid email';
  static const String email_empty_msg = 'Enter an email address';

  static const String valid_mobile_msg = 'Enter valid mobile number';
  static const String mobile_empty_msg = 'Enter mobile number';
  static const String upi_empty_msg = 'Enter upi Id';
  static const String valid_upi_msg = 'Enter valid upi Id';

  static const String ENTER_VALID_CARD_NAME = "Please enter a name on card";
  static const String ENTER_VALID_CARD_NUMBER = "Please enter card number";
  static const String ENTER_INVALID_CARD_NUMBER = "Please enter valid card number";
  static const String ENTER_EXPIRY_DATE = "Please enter expiry date of card ";
  static const String ENTER_VALID_EXPIRY_DATE = "Please enter valid expiry date of card ";
  static const String ENTER_VALID_CVV = "Please enter CVV Number";
  static const String ENTER_INVALID_CVV = "Please enter valid CVV Number";

  static const String SUCCESS = "Success";
  static const String FAILURE = "Failure";
  static const String ERROR = "Error";
  static const String OK = "OK";
  static const String EMAIL = "Email";
  static const String USERNAME = "UserName";

  static const String INVALID_EMAIL_MESSAGE = 'Email can\'t be empty';
  static const String INVALID_FULLNAME_MESSAGE = 'Full Name can\'t be empty';
  static const String ENTER_VALID_EMAIL_MESSAGE = "Please enter a valid email";
  static const String ENTER_PHONE_NUMBER = "Please enter a phone Number";
  static const String ENTER_VALIDE_PHONE_NUMBER = "Please enter a phone Number";
  static const String INTERNET_CONNECTIVITY_ERROR_MESSAGE =
      "Please check your internet connection and try again later.";


  ///API strings
  //static const String PRODUCTION_BASE_URL = "https://www.avantgardepayments.com/";
  static const String PRODUCTION_BASE_URL = "https://www.avantgardepayments.com/";
  static const String TEST_BASE_URL = "https://pguat.safexpay.com/";
  // static const String TEST_BASE_URL = "https://test.avantgardepayments.com/";
  static Environment environment = Environment.TEST;
  static String baseUrl = environment == Environment.TEST ? TEST_BASE_URL : PRODUCTION_BASE_URL;
  static String getMerchantBrandingDetails = baseUrl + "agcore/api/query/merchantBrandingDetails";
  static String getMerchantCards = baseUrl + "agcore/api/query/getCardsByMerchant";
  static String getPaymentMode = baseUrl + "agcore/api/query/payModeAndSchemeAPI";
  static String makePayment = baseUrl + "agcore/appPay";
  static String getCardType = baseUrl + "agcore/api/query/cardtype";
  static String getSavedCards = baseUrl + "agcore/api/query/getCardsByMerchant";


}