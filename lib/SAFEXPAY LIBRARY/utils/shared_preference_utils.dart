import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils{
  static const String merchantLogo = 'merchant_logo';
  static const String merchantIntegrationType = 'merchant_integration_type';
  static const String headingBgColor = 'heading_bg_color';
  static const String bgColor = 'bg_color';
  static const String menuColor = 'menu_color';
  static const String footerColor = 'footer_color';
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';
  static const String userMobile = 'user_mobile';
  static const String Udf1 = 'udf1';
  static const String Udf2 = 'udf2';
  static const String Udf3 = 'udf3';
  static const String Udf4 = 'udf4';
  static const String Udf5 = 'udf5';


  static Future<void> saveMerchantDetails(String merchantLogo, String merchantIntegrationType,
      String headingBgColor, String bgColor, String menuColor, String footerColor) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SharedPreferenceUtils.merchantLogo, merchantLogo);
    sharedPreferences.setString(SharedPreferenceUtils.merchantIntegrationType, merchantIntegrationType);
    sharedPreferences.setString(SharedPreferenceUtils.headingBgColor, headingBgColor);
    sharedPreferences.setString(SharedPreferenceUtils.bgColor, bgColor);
    sharedPreferences.setString(SharedPreferenceUtils.menuColor, menuColor);
    sharedPreferences.setString(SharedPreferenceUtils.footerColor, footerColor);
  }

  static Future<void> saveUserDetails(String name, String emailId, String mobile) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SharedPreferenceUtils.userName, name);
    sharedPreferences.setString(SharedPreferenceUtils.userEmail, emailId);
    sharedPreferences.setString(SharedPreferenceUtils.userMobile, mobile);
  }

  static Future<void> saveUdf(String UDF1, String UDF2, String UDF3 , String UDF4 , String UDF5) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SharedPreferenceUtils.Udf1, UDF1);
    sharedPreferences.setString(SharedPreferenceUtils.Udf2, UDF2);
    sharedPreferences.setString(SharedPreferenceUtils.Udf3, UDF3);
    sharedPreferences.setString(SharedPreferenceUtils.Udf4, UDF4);
    sharedPreferences.setString(SharedPreferenceUtils.Udf5, UDF5);
  }
}