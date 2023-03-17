
import 'package:hospital_app/constants/strings.dart';

class MerchantConstants{
  static late String merchantId;
  static late String merchantKey;
  static late String agId;

  static void setDetails({required String mId, required String mKey, required String aggId, required Environment environment}){
    merchantId = mId;
    merchantKey = mKey;
    agId = aggId;
    StringConstants.environment = environment;
  }
}