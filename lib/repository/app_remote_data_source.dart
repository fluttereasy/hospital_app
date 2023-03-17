import 'package:http/http.dart';

import '../remote/api_client.dart';
import 'app_data_source.dart';

class AppRemoteDataSource extends AppDataSource{
  ApiClient apiClient = ApiClient();

  @override
  Future<Response> getMerchantBrandingDetails(String merchantId) {
    return apiClient.getMerchantBrandingDetails(merchantId);
  }

  @override
  Future<Response> getMerchantPayModeAndScheme(String merchantId) {
    return apiClient.getMerchantPayModeAndScheme(merchantId);
  }

  @override
  Future<Response> getCardType(String cardNumber, String merchantId) {
    return apiClient.getCardType(cardNumber, merchantId);
  }

  @override
  Future<Response> makePayment(String txnDetails, String pgDetails,
      String cardDetails, String custDetails, String billDetails,
      String shipDetails, String itemDetails, String otherDetails,
      String merchantId){
    return apiClient.makePayment(txnDetails, pgDetails, cardDetails, custDetails, billDetails, shipDetails, itemDetails, otherDetails, merchantId);
  }

  @override
  Future<Response> getSavedCards(String merchantId) {
    return apiClient.getSavedCards(merchantId);
  }
}