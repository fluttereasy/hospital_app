
import 'base_api_response.dart';

class MerchantBrandingDetailsResponse extends BaseApiResponse{
  late String merchantBrandingDetails;


  MerchantBrandingDetailsResponse.fromJson(Map<String, dynamic> jsonMap){
    merchantBrandingDetails = jsonMap['merchantBrandingDetails'];
    errorDetails = ErrorDetails.fromJson(jsonMap['error_details']);
  }
}



class MerchantBrandingDetails {
  late String logo;
  late String integrationType;
  late MerchantThemeDetails merchantThemeDetails;

  MerchantBrandingDetails.fromJson(Map<String, dynamic> jsonMap){
    logo = jsonMap['logo'];
    integrationType = jsonMap['integration_type'];
    merchantThemeDetails = MerchantThemeDetails.fromJson(jsonMap['merchantThemeDetails']);
  }
}

class MerchantThemeDetails {
  late String headingBgColor;
  late String bgColor;
  late String menuColor;
  late String footerColor;

  MerchantThemeDetails.fromJson(Map<String, dynamic> jsonMap){
    headingBgColor = jsonMap['heading_bgcolor'];
    bgColor = jsonMap['bgcolor'];
    menuColor = jsonMap['menu_color'];
    footerColor = jsonMap['footer_color'];
  }
}
