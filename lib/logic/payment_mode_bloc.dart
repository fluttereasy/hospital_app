import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/logic/safex_pay_bloc.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import '../constants/keyword_constants.dart';
import '../constants/merchant_constants.dart';
import '../model/merchant_pay_mode_schemes_response.dart';
import '../repository/app_repository.dart';
import '../utils/crypto_utils.dart';

class PaymentModeBloc {
  PaymentModeBloc({required this.safeXPayBloc});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  List<PaymentMode>? paymentModeList;
  AppRepository appRepository = AppRepository();
  late SafeXPayBloc safeXPayBloc;

  BehaviorSubject<bool> loaderController = BehaviorSubject<bool>();

  void dispose() {
    loaderController.close();
  }

  Future<void> getMerchantPayModes() async {
    loaderController.add(true);
    String? encodedMerchantId = CryptoUtils.encrypt(
        MerchantConstants.merchantId, KeywordConstants.internalKey);
    await appRepository.getMerchantPayModeAndScheme(encodedMerchantId!).then(
            (Response response) async {
          debugPrint(
              'Get merchant payment mode api response is ${response.body}');
          MerchantPayModeSchemesResponse payModeSchemesResponse =
          MerchantPayModeSchemesResponse.fromJson(json.decode(response.body));
          String encryptedSchemes = payModeSchemesResponse.payModeSchemes;
          String? schemes = CryptoUtils.decrypt(
              encryptedSchemes,
              MerchantConstants.merchantKey);
          debugPrint('Decrypted schemes are $schemes');
          if(schemes != null && schemes.isNotEmpty){
            paymentModeList = <PaymentMode>[];
            List<dynamic> jsonMapList = json.decode(schemes);
            for(Map<String, dynamic> jsonMap in jsonMapList){
              paymentModeList?.add(PaymentMode.fromJson(jsonMap));
            }
          }
          loaderController.add(false);
        }, onError: (dynamic e) {
      loaderController.add(false);
      debugPrint(
          'Get merchant payment mode api exception is ${e.toString()}');
    });
  }
}