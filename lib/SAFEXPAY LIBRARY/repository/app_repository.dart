import 'package:http/http.dart';

import 'app_data_source.dart';
import 'app_remote_data_source.dart';

class AppRepository extends AppDataSource {
  AppRepository();

  AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();

  @override
  Future<Response> getMerchantBrandingDetails(String merchantId) {
    return appRemoteDataSource.getMerchantBrandingDetails(merchantId);
  }

  @override
  Future<Response> getMerchantPayModeAndScheme(String merchantId) {
    return appRemoteDataSource.getMerchantPayModeAndScheme(merchantId);
  }

  @override
  Future<Response> getCardType(String cardNumber, String merchantId) {
    return appRemoteDataSource.getCardType(cardNumber, merchantId);
  }

  @override
  Future<Response> makePayment(String txnDetails, String pgDetails,
      String cardDetails, String custDetails, String billDetails,
      String shipDetails, String itemDetails, String otherDetails,
      String merchantId){
    return appRemoteDataSource.makePayment(txnDetails, pgDetails, cardDetails, custDetails, billDetails, shipDetails, itemDetails, otherDetails, merchantId);
  }

  @override
  Future<Response> getSavedCards(String merchantId) {
    return appRemoteDataSource.getSavedCards(merchantId);
  }
}