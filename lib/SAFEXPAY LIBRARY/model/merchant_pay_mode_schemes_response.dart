
import 'base_api_response.dart';

class MerchantPayModeSchemesResponse extends BaseApiResponse {
  late String payModeSchemes;

  MerchantPayModeSchemesResponse.fromJson(Map<String, dynamic> jsonMap) {
    payModeSchemes = jsonMap['schemes'];
    errorDetails = ErrorDetails.fromJson(jsonMap['error_details']);
  }
}

class PaymentMode {
  late String paymentMode;
  late String payModeId;
  List<PaymentModeDetails>? paymentModeDetailsList;

  PaymentMode.fromJson(Map<String, dynamic> jsonMap){
    paymentMode = jsonMap['paymentMode'];
    payModeId = jsonMap['payModeId'];

    if(jsonMap.containsKey('paymentModeDetailsList') &&
        (jsonMap['paymentModeDetailsList'] as List<dynamic>).isNotEmpty){
        paymentModeDetailsList = <PaymentModeDetails>[];
        for(Map<String, dynamic> map in jsonMap['paymentModeDetailsList']){
          paymentModeDetailsList!.add(PaymentModeDetails.fromJson(map));
        }
    }
  }
}

class PaymentModeDetails {
  SchemeDetails? schemeDetailsResponse;
  PgDetails? pgDetailsResponse;
  String? webViewUrl;

  PaymentModeDetails.fromJson(Map<String, dynamic> jsonMap) {
    if (jsonMap.containsKey('webViewUrl')) {
      webViewUrl = jsonMap['webViewUrl'];
    }

    if (jsonMap.containsKey('schemeDetailsResponse')) {
      schemeDetailsResponse =
          SchemeDetails.fromJson(jsonMap['schemeDetailsResponse']);
    }

    if (jsonMap.containsKey('pgDetailsResponse')) {
      pgDetailsResponse = PgDetails.fromJson(jsonMap['pgDetailsResponse']);
    }
  }
}

class SchemeDetails {
  String? schemeId;
  String? schemeName;

  SchemeDetails.fromJson(Map<String, dynamic> jsonMap) {
    schemeId = jsonMap['schemeId'];
    schemeName = jsonMap['schemeName'];
  }
}

class PgDetails {
  String? pgId;
  String? pgName;
  String? pgIcon;

  PgDetails.fromJson(Map<String, dynamic> jsonMap) {
    pgId = jsonMap['pg_id'];
    pgName = jsonMap['pg_name'];
    if(jsonMap.containsKey('pg_icon')) {
      pgIcon = jsonMap['pg_icon'];
    }
  }
}
