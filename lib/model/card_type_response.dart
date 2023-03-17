
import 'base_api_response.dart';

class CardTypeResponse extends BaseApiResponse{
  String? cardType;

  CardTypeResponse.fromJson(Map<String, dynamic> jsonMap){
    cardType = jsonMap['cardType'];
    errorDetails = ErrorDetails.fromJson(jsonMap['error_details']);
  }
}