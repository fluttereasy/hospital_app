import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import '../cardDetails.dart';
import '../constants/keyword_constants.dart';
import '../constants/merchant_constants.dart';
import '../make_payment_webview.dart';
import '../PaymentMode.dart' as payMode;
import '../model/card_type_response.dart';
import '../model/merchant_branding_details_response.dart';
import '../model/merchant_pay_mode_schemes_response.dart';
import '../model/saved_card_response.dart';
import '../repository/app_repository.dart';
import '../utils/crypto_utils.dart';
import '../utils/shared_preference_utils.dart';

class SafeXPayBloc {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  AppRepository appRepository = AppRepository();
  List<PaymentMode>? paymentModeList;
  late PaymentMode nbPaymentMode;
  List<PaymentModeDetails> filteredNBPaymentList = <PaymentModeDetails>[];
  List<PaymentModeDetails> nbStaticPaymentList = <PaymentModeDetails>[];
  List<PaymentModeDetails> walletPaymentList = <PaymentModeDetails>[];
  List<PaymentModeDetails> upiPaymentList = <PaymentModeDetails>[];
  List<SavedCard> savedCardsList = <SavedCard>[];
  List<payMode.PaymentMethodModel> paymentMethodList =
      <payMode.PaymentMethodModel>[];
  String selectedCardType = '';
  PaymentModeDetails? selectedNBPaymentMethod;
  PaymentModeDetails? selectedWalletPaymentMethod;
  CardType selectedCreditCardType = CardType.unknown;

  TextEditingController expiryDateController =
      MaskedTextController(mask: '00/00');
  TextEditingController cardNumberController =
      MaskedTextController(mask: '0000 00** **** 0000');
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cvvNumberController = MaskedTextController(mask: '000');

  SafeXPayBloc(
      {required this.orderNo,
      required this.amount,
      required this.currency,
      required this.transactionType,
      required this.channel,
      required this.successUrl,
      required this.failureUrl,
      required this.countryCode});

  late String orderNo;
  late double amount;
  late String currency;
  late String transactionType;
  late String channel;
  late String successUrl;
  late String failureUrl;
  late String countryCode;

  /// Allowed payment options for the merchant
  bool cardPaymentFlag = true;
  bool netBankingPaymentFlag = true;
  bool walletPaymentFlag = true;
  bool upiPaymentFlag = true;

  BehaviorSubject<bool> loaderController = BehaviorSubject<bool>();
  BehaviorSubject<bool> payModeListController = BehaviorSubject<bool>();
  BehaviorSubject<bool> nbStaticListController = BehaviorSubject<bool>();
  BehaviorSubject<bool> walletListController = BehaviorSubject<bool>();
  BehaviorSubject<bool> nbFilterListController = BehaviorSubject<bool>();
  BehaviorSubject<bool> savedCardsListController = BehaviorSubject<bool>();
  BehaviorSubject<bool> autoValidateController = BehaviorSubject<bool>();
  BehaviorSubject<PaymentModeDetails> selectedNBPaymentMethodController =
      BehaviorSubject<PaymentModeDetails>();

  void dispose() {
    loaderController.close();
    payModeListController.close();
    nbStaticListController.close();
    walletListController.close();
    nbFilterListController.close();
    savedCardsListController.close();
    autoValidateController.close();
    selectedNBPaymentMethodController.close();
  }

  void setAllowedPaymentMethods({
    bool allowCardPayment = true,
    bool allowNetBankingPayment = true,
    bool allowWalletPayment = true,
    bool allowUPIPayment = true,
  }) {
    cardPaymentFlag = allowCardPayment;
    netBankingPaymentFlag = allowNetBankingPayment;
    walletPaymentFlag = allowWalletPayment;
    upiPaymentFlag = allowUPIPayment;
  }

  Future<void> getBrandingDetails() async {
    loaderController.add(true);
    String? encodedMerchantId = CryptoUtils.encrypt(
        MerchantConstants.merchantId, KeywordConstants.internalKey);
    await appRepository.getMerchantBrandingDetails(encodedMerchantId!).then(
        (Response response) async {
      //debugPrint('Get merchant branding details api response is ${response.body}');
      MerchantBrandingDetailsResponse merchantBrandingDetailsResponse =
          MerchantBrandingDetailsResponse.fromJson(json.decode(response.body));
      if (merchantBrandingDetailsResponse.merchantBrandingDetails.isNotEmpty) {
        String? strMerchantBrandingDetails = CryptoUtils.decrypt(
            merchantBrandingDetailsResponse.merchantBrandingDetails,
            MerchantConstants.merchantKey);

        if (strMerchantBrandingDetails != null) {
          MerchantBrandingDetails merchantBrandingDetails =
              MerchantBrandingDetails.fromJson(
                  json.decode(strMerchantBrandingDetails));
          //debugPrint('Decoded Merchant branding details are ${merchantBrandingDetails.integrationType}');
          await SharedPreferenceUtils.saveMerchantDetails(
              merchantBrandingDetails.logo,
              merchantBrandingDetails.integrationType,
              merchantBrandingDetails.merchantThemeDetails.headingBgColor,
              merchantBrandingDetails.merchantThemeDetails.bgColor,
              merchantBrandingDetails.merchantThemeDetails.menuColor,
              merchantBrandingDetails.merchantThemeDetails.footerColor);
        }
      }
      loaderController.add(false);
    }, onError: (dynamic e) {
      loaderController.add(false);
      //debugPrint('Get merchant branding details api exception is ${e.toString()}');
    });
  }

  Future<void> saveUserDetails(
      {required String name,
      required String emailId,
      required String mobile}) async {
    loaderController.add(true);
    Future.delayed(Duration(seconds: 1), () async {
      await SharedPreferenceUtils.saveUserDetails(name, emailId, mobile);
      loaderController.add(false);
    });
  }

  Future<void> saveUdf(
      {required String udf1,
    required String udf2,
    required String udf3,
    required String udf4,
    required String udf5})  async {
    loaderController.add(true);
    Future.delayed(Duration(seconds: 1), () async {
      await SharedPreferenceUtils.saveUdf(udf1, udf2, udf3,udf4,udf5);
      loaderController.add(false);
    });
  }

  Future<void> getMerchantPayModes() async {
    loaderController.add(true);
    String? encodedMerchantId = CryptoUtils.encrypt(
        MerchantConstants.merchantId, KeywordConstants.internalKey);
    await appRepository.getMerchantPayModeAndScheme(encodedMerchantId!).then(
        (Response response) async {
      //debugPrint('Get merchant payment mode api response is ${response.body}');
      MerchantPayModeSchemesResponse payModeSchemesResponse =
          MerchantPayModeSchemesResponse.fromJson(json.decode(response.body));
      String encryptedSchemes = payModeSchemesResponse.payModeSchemes;
      String? schemes =
          CryptoUtils.decrypt(encryptedSchemes, MerchantConstants.merchantKey);
      //debugPrint('Decrypted schemes are $schemes');
      if (schemes != null && schemes.isNotEmpty) {
        paymentModeList = <PaymentMode>[];
        List<dynamic> jsonMapList = json.decode(schemes);

        final payMode.PaymentMethodModel model1 = payMode.PaymentMethodModel(
            "packages/safexpay/img/ic_card.png", "CREDIT/DEBIT/ATM CARD",
            preference: 1);
        final payMode.PaymentMethodModel model2 = payMode.PaymentMethodModel(
            "packages/safexpay/img/ic_bank.png", "NET BANKING",
            preference: 2);
        final payMode.PaymentMethodModel model3 = payMode.PaymentMethodModel(
            "packages/safexpay/img/ic_wallet.png", "WALLETS",
            preference: 3);
        final payMode.PaymentMethodModel model4 = payMode.PaymentMethodModel(
            "packages/safexpay/img/ic_upi.png", "UPI",
            preference: 4);

        paymentMethodList.clear();

        for (Map<String, dynamic> jsonMap in jsonMapList) {
          PaymentMode paymentMode = PaymentMode.fromJson(jsonMap);
          paymentModeList?.add(paymentMode);
          //debugPrint('Payment mode id is ${paymentMode.payModeId}');
          if (paymentMode.payModeId == "NB" && netBankingPaymentFlag) {
            paymentMethodList.add(model2);
            nbPaymentMode = paymentMode;
            filteredNBPaymentList.clear();
            filteredNBPaymentList.addAll(nbPaymentMode.paymentModeDetailsList!);
            generateStaticNBList();
          }
          if (paymentMode.payModeId == "CC" &&
              !paymentMethodList.contains(model1) &&
              cardPaymentFlag) {
            paymentMethodList.add(model1);
          }
          if (paymentMode.payModeId == "DC" &&
              !paymentMethodList.contains(model1) &&
              cardPaymentFlag) {
            paymentMethodList.add(model1);
          }

          /// Remove before comment once UP payment mode implementation is done
          if (paymentMode.payModeId == "UP" && upiPaymentFlag) {
            paymentMethodList.add(model4);
            upiPaymentList.clear();
            upiPaymentList.addAll(paymentMode.paymentModeDetailsList!);
            /*for(PaymentModeDetails paymentModeDetails in paymentMode.paymentModeDetailsList!){
              ////debugPrint('${paymentModeDetails.pgDetailsResponse!.pgName} Upi payment icon is ${paymentModeDetails.pgDetailsResponse!.pgIcon}');
            }*/
          }
          if (paymentMode.payModeId == 'WA' && walletPaymentFlag) {
            paymentMethodList.add(model3);
            walletPaymentList.clear();
            walletPaymentList.addAll(paymentMode.paymentModeDetailsList!);
            if (walletPaymentList.isNotEmpty) {
              walletListController.add(true);
            } else {
              walletListController.add(false);
            }
          }
        }
      }
      if (paymentMethodList.isNotEmpty) {
        paymentMethodList.sort((a, b) => a.preference.compareTo(b.preference));
        payModeListController.add(true);
      } else {
        payModeListController.add(false);
      }
      loaderController.add(false);
    }, onError: (dynamic e) {
      loaderController.add(false);
      //debugPrint('Get merchant payment mode api exception is ${e.toString()}');
    });
  }

  Future<void> getCardType(String cardNumber) async {
    String? encodedMerchantId = CryptoUtils.encrypt(
        MerchantConstants.merchantId, KeywordConstants.internalKey);
    await appRepository.getCardType(cardNumber, encodedMerchantId!).then(
        (Response response) async {
      //debugPrint('Get card type api response is ${response.body}');
      CardTypeResponse cardTypeResponse =
          CardTypeResponse.fromJson(json.decode(response.body));
      if (cardTypeResponse.cardType != null &&
          cardTypeResponse.cardType!.isNotEmpty) {
        String? cardTypeJson = CryptoUtils.decrypt(
            cardTypeResponse.cardType!, MerchantConstants.merchantKey);
        Map<String, dynamic> map = json.decode(cardTypeJson!);
        selectedCardType = map['card_type'];
        //debugPrint('Card type is $selectedCardType');
      }
    }, onError: (dynamic e) {
      //debugPrint('Get card type api exception is ${e.toString()}');
    });
  }

  void getCardTypeAndPGDetails(String cardNumber) {
    CardType type = detectCardType(cardNumber);
    selectedCreditCardType = type;
    //debugPrint('Card type is $type');
  }

  Future<String?> makePayment(
      String? encryptedTransactionDetails,
      String? encryptedPgDetails,
      String? encryptedCardDetails,
      String? encryptedUserDetails,
      String? billDetails,
      String? shipDetails,
      String? itemDetails,
      String? otherDetails,
      String merchantId,
      BuildContext context) async {
    // loaderController.add(true);
    String? responseData = await appRepository
        .makePayment(
            encryptedTransactionDetails!,
            encryptedPgDetails!,
            encryptedCardDetails!,
            encryptedUserDetails!,
            billDetails!,
            shipDetails!,
            itemDetails!,
            otherDetails!,
            merchantId)
        .then((Response response) async {
      //debugPrint('Make Payment api response is ${response.body}');

      // loaderController.add(false);
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    }, onError: (dynamic e) {
      // loaderController.add(false);
      //debugPrint('Make Payment api exception is ${e.toString()}');
      return null;
    });

    return responseData;
  }

  void generateStaticNBList() {
    nbStaticPaymentList.clear();
    for (PaymentModeDetails paymentModeDetails
        in nbPaymentMode.paymentModeDetailsList!) {
      if ([
        'State Bank Of India',
        'ICICI Bank',
        'YES Bank',
        'Axis Bank',
        'HDFC Bank',
        'Kotak Bank'
      ].contains(paymentModeDetails.pgDetailsResponse!.pgName)) {
        nbStaticPaymentList.add(paymentModeDetails);
      }
    }
    if (nbStaticPaymentList.isNotEmpty) {
      nbStaticListController.add(true);
    } else {
      nbStaticListController.add(false);
    }
  }

  Future<void> getSavedCards() async {
    // loaderController.add(true);
    savedCardsList.clear();
    String? encodedMerchantId = CryptoUtils.encrypt(
        MerchantConstants.merchantId, KeywordConstants.internalKey);
    await appRepository.getSavedCards(encodedMerchantId!).then(
            (Response response) async {
          //debugPrint('Get saved cards api response is ${response.body}');
          SavedCardsResponse savedCardsResponse =
          SavedCardsResponse.fromJson(json.decode(response.body));
          if (savedCardsResponse.merchantSavedCards.isNotEmpty) {
            String? strSavedCard = CryptoUtils.decrypt(
                savedCardsResponse.merchantSavedCards,
                MerchantConstants.merchantKey);

            if (strSavedCard != null) {
              savedCardsList.clear();
              List<dynamic> savedCardsMap = json.decode(strSavedCard);
              for(Map<String, dynamic> map in savedCardsMap){
                SavedCard savedCard = SavedCard.fromJson(map);
                //debugPrint('Decoded saved card details are ${savedCard.nameOnCard}');
                savedCardsList.add(savedCard);
              }
            }
          }
          if(savedCardsList.isNotEmpty){
            savedCardsListController.add(true);
          } else {
            savedCardsListController.add(false);
          }
          // loaderController.add(false);
        }, onError: (dynamic e) {
      // loaderController.add(false);
      savedCardsListController.add(false);
      //debugPrint('Get saved cards api exception is ${e.toString()}');
    });
  }
}

enum CardType {
  visa,
  amex,
  discover,
  mastercard,
  dinersclub,
  jcb,
  unionpay,
  maestro,
  elo,
  mir,
  hiper,
  hipercard,
  unknown,
}

const Map<CardType, Set<List<String>>> cardNumbersPatterns = {
  CardType.visa: {
    ['4'],
  },
  CardType.amex: {
    ['34'],
    ['37'],
  },
  CardType.discover: {
    ['6011'],
    ['644', '649'],
    ['65'],
  },
  CardType.mastercard: {
    ['51', '55'],
    ['2221', '2229'],
    ['223', '229'],
    ['23', '26'],
    ['270', '271'],
    ['2720'],
  },
  CardType.dinersclub: {
    ['300', '305'],
    ['36'],
    ['38'],
    ['39'],
  },
  CardType.jcb: {
    ['3528', '3589'],
    ['2131'],
    ['1800'],
  },
  CardType.unionpay: {
    ['620'],
    ['624', '626'],
    ['62100', '62182'],
    ['62184', '62187'],
    ['62185', '62197'],
    ['62200', '62205'],
    ['622010', '622999'],
    ['622018'],
    ['622019', '622999'],
    ['62207', '62209'],
    ['622126', '622925'],
    ['623', '626'],
    ['6270'],
    ['6272'],
    ['6276'],
    ['627700', '627779'],
    ['627781', '627799'],
    ['6282', '6289'],
    ['6291'],
    ['6292'],
    ['810'],
    ['8110', '8131'],
    ['8132', '8151'],
    ['8152', '8163'],
    ['8164', '8171'],
  },
  CardType.maestro: {
    ['493698'],
    ['500000', '506698'],
    ['506779', '508999'],
    ['56', '59'],
    ['63'],
    ['67']
  },
  CardType.elo: {
    ['401178'],
    ['401179'],
    ['438935'],
    ['457631'],
    ['457632'],
    ['431274'],
    ['451416'],
    ['457393'],
    ['504175'],
    ['506699', '506778'],
    ['509000', '509999'],
    ['627780'],
    ['636297'],
    ['636368'],
    ['650031', '650033'],
    ['650035', '650051'],
    ['650405', '650439'],
    ['650485', '650538'],
    ['650541', '650598'],
    ['650700', '650718'],
    ['650720', '650727'],
    ['650901', '650978'],
    ['651652', '651679'],
    ['655000', '655019'],
    ['655021', '655058'],
  },
  CardType.mir: {
    ['2200', '2204'],
  },
  CardType.hiper: {
    ['637095'],
    ['637568'],
    ['637599'],
    ['637609'],
    ['637612'],
  },
  CardType.hipercard: {
    ['606282'],
  }
};

CardType detectCardType(String ccNumStr) {
  CardType cardType = CardType.unknown;

  if (ccNumStr.isEmpty) {
    return cardType;
  }

  //TODO error checking for strings with non-numerical chars

  cardNumbersPatterns.forEach(
    (CardType type, Set<List<String>> patterns) {
      for (List<String> patternRange in patterns) {
        // Remove any spaces
        String ccPatternStr = ccNumStr.replaceAll(RegExp(r'\s+\b|\b\s'), '');
        int rangeLen = patternRange[0].length;
        // Trim the CC number str to match the pattern prefix length
        if (rangeLen < ccNumStr.length) {
          ccPatternStr = ccPatternStr.substring(0, rangeLen);
        }

        if (patternRange.length > 1) {
          // Convert the prefix range into numbers then make sure the
          // CC num is in the pattern range.
          // Because Strings don't have '>=' type operators
          int ccPrefixAsInt = int.parse(ccPatternStr);
          int startPatternPrefixAsInt = int.parse(patternRange[0]);
          int endPatternPrefixAsInt = int.parse(patternRange[1]);
          if (ccPrefixAsInt >= startPatternPrefixAsInt &&
              ccPrefixAsInt <= endPatternPrefixAsInt) {
            // Found a match
            cardType = type;
            break;
          }
        } else {
          // Just compare the single pattern prefix with the CC prefix
          if (ccPatternStr == patternRange[0]) {
            // Found a match
            cardType = type;
            break;
          }
        }
      }
    },
  );

  return cardType;
}
