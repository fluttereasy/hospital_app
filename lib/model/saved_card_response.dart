
import 'base_api_response.dart';

class SavedCardsResponse extends BaseApiResponse{
  late String merchantSavedCards;


  SavedCardsResponse.fromJson(Map<String, dynamic> jsonMap){
    merchantSavedCards = jsonMap['cardsDetails'];
    errorDetails = ErrorDetails.fromJson(jsonMap['error_Details']);
  }
}

class SavedCard {
  late String nameOnCard;
  late String firstSixDigits;
  late String lastFourDigits;
  late String expiryMonth;
  late String expiryYear;
  late String payModeId;

  SavedCard.fromJson(Map<String, dynamic> jsonMap){
    nameOnCard = jsonMap['nameOnCard'];
    firstSixDigits = jsonMap['first6Digits'];
    lastFourDigits = jsonMap['last4Digits'];
    expiryMonth = jsonMap['expiryMonth'];
    expiryYear = jsonMap['expiryYear'];
    payModeId = jsonMap['payModeId'];
  }
}