import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constants/strings.dart';

class ApiClient {
  Future<Response> getMerchantBrandingDetails(String merchantId) async {
    //debugPrint('Calling get merchant branding details api ${StringConstants.getMerchantBrandingDetails} with merchantId $merchantId');

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final getMerchantDetailsRequestJson = jsonEncode({"me_id": merchantId});

    try {
      final Response response = await http.post(
          Uri.parse(StringConstants.getMerchantBrandingDetails),
          body: getMerchantDetailsRequestJson,
          headers: headers);
      return response;
    } catch (e) {
      //debugPrint('Fetch merchant branding details api exception is ${e.toString()}');
      rethrow;
    }
  }

  Future<Response> getMerchantPayModeAndScheme(String merchantId) async {
    //debugPrint('Calling get merchant pay modes and scheme api ${StringConstants.getPaymentMode} with merchantId $merchantId');

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final getMerchantDetailsRequestJson = jsonEncode({"me_id": merchantId});

    try {
      final Response response = await http.post(
          Uri.parse(StringConstants.getPaymentMode),
          body: getMerchantDetailsRequestJson,
          headers: headers);
      return response;
    } catch (e) {
      //debugPrint('Fetch merchant payment mode api exception is ${e.toString()}');
      rethrow;
    }
  }

  Future<Response> getCardType(String cardNumber, String merchantId) async {
    final getCardTypeRequestJson =
        jsonEncode({"cardBin": cardNumber, "meid": merchantId});

    //debugPrint('Calling api get card type ${StringConstants.getCardType} with body $getCardTypeRequestJson');

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    try {
      final Response response = await http.post(
          Uri.parse(StringConstants.getCardType),
          body: getCardTypeRequestJson,
          headers: headers);
      return response;
    } catch (e) {
      //debugPrint('Get Card Type api exception is ${e.toString()}');
      rethrow;
    }
  }

  Future<Response> makePayment(
    String txnDetails,
    String pgDetails,
    String cardDetails,
    String custDetails,
    String billDetails,
    String shipDetails,
    String itemDetails,
    String otherDetails,
    String merchantId
  ) async {
    final makePaymentRequestJson = jsonEncode({
      'txn_details': txnDetails,
      'pg_details': pgDetails,
      'card_details': cardDetails,
      'cust_details': custDetails,
      'bill_details': billDetails,
      'ship_details': shipDetails,
      'item_details': itemDetails,
      'other_details': otherDetails,
      'me_id': merchantId
    });

    //debugPrint('Calling api make payment ${StringConstants.makePayment} with body $makePaymentRequestJson');

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    try {
      final Response response = await http.post(
          Uri.parse(StringConstants.makePayment),
          body: makePaymentRequestJson,
          headers: headers);
      return response;
    } catch (e) {
      //debugPrint('Make Payment api exception is ${e.toString()}');
      rethrow;
    }
  }

  Future<Response> getSavedCards(String merchantId) async {
    //debugPrint('Calling get saved cards api ${StringConstants.getSavedCards} with merchantId $merchantId');

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final getMerchantDetailsRequestJson = jsonEncode({"me_id": merchantId});

    try {
      final Response response = await http.post(
          Uri.parse(StringConstants.getSavedCards),
          body: getMerchantDetailsRequestJson,
          headers: headers);
      return response;
    } catch (e) {
      //debugPrint('Fetch saved cards api exception is ${e.toString()}');
      rethrow;
    }
  }
}
