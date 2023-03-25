abstract class AppDataSource {
  void getMerchantBrandingDetails(String merchantId);
  void getMerchantPayModeAndScheme(String merchantId);
  void getCardType(String cardNumber, String merchantId);
  void makePayment(String txnDetails, String pgDetails, String cardDetails,
      String custDetails, String billDetails, String shipDetails,
      String itemDetails, String otherDetails, String merchantId);
  void getSavedCards(String merchantId);
}