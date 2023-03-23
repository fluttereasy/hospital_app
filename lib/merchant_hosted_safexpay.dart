import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'AppHeader.dart';
import 'SAFEXPAY LIBRARY/constants/merchant_constants.dart';
import 'SAFEXPAY LIBRARY/constants/strings.dart';
import 'SAFEXPAY LIBRARY/constants/utility.dart';
import 'SAFEXPAY LIBRARY/logic/RequestPage.dart';
import 'SAFEXPAY LIBRARY/logic/safex_pay_bloc.dart';
import 'SAFEXPAY LIBRARY/observer/safexpay_observable.dart';
import 'SAFEXPAY LIBRARY/observer/safexpay_observer.dart';
import 'SAFEXPAY LIBRARY/utils/crypto_utils.dart';
import 'make_payment_webview.dart';


class MHSafeXPayGateway extends StatefulWidget {
  MHSafeXPayGateway(
      {required this.orderNo,
      required this.amount,
      required this.currency,
      required this.transactionType,
      required this.channel,
      required this.successUrl,
      required this.failureUrl,
      required this.countryCode,
      required this.pgDetails,
      required this.customerDetails,
      required this.cardDetails,
      required this.billDetails,
      required this.shipDetails,
      required this.itemDetails,
      required this.upiDetails,
      required this.otherDetails});

  final String orderNo;
  final double amount;
  final String currency;
  final String transactionType;
  final String channel;
  final String successUrl;
  final String failureUrl;
  final String countryCode;

  final String pgDetails;
  final String customerDetails;
  final String cardDetails;
  final String billDetails;
  final String shipDetails;
  final String itemDetails;
  final String upiDetails;
  final String otherDetails;

  @override
  _SafeXPayGatewayState createState() => _SafeXPayGatewayState();
}

class _SafeXPayGatewayState extends State<MHSafeXPayGateway>
    implements SafeXPayObserver {
  late SafeXPayBloc safeXPayBloc;
  int currentIndex = 0;
  SafeXPayObservable _safeXPayObservable = SafeXPayObservable();

  @override
  void initState() {
    _safeXPayObservable.register(this);
    safeXPayBloc = SafeXPayBloc(
        orderNo: widget.orderNo,
        amount: widget.amount,
        currency: widget.currency,
        transactionType: widget.transactionType,
        channel: widget.channel,
        successUrl: widget.successUrl,
        failureUrl: widget.failureUrl,
        countryCode: widget.countryCode);

    getMerchantBrandingDetails();
    generateChildrenList();
    super.initState();
  }

  Future<void> getMerchantBrandingDetails() async {
    bool isInternetAvailable = await Utility.isNetworkAvailable();

    if (isInternetAvailable) {
      safeXPayBloc.getBrandingDetails();
      //safeXPayBloc.getCardType('607385');

    } else {
      Utility.ackAlert(
          context, StringConstants.INTERNET_CONNECTIVITY_ERROR_MESSAGE);
    }
  }

  void generateChildrenList() {
    proceedPayment(context);
  }

  @override
  void dispose() {
    _safeXPayObservable.unRegister(this);
    safeXPayBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: safeXPayBloc.scaffoldKey,
      body: StreamBuilder<bool>(
          stream: safeXPayBloc.loaderController.stream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            bool inAsyncCall = false;
            if (snapshot.hasData && snapshot.data != null) {
              inAsyncCall = snapshot.data!;
            }
            return ModalProgressHUD(
              inAsyncCall: inAsyncCall,
              child: Column(
                children: [
                  AppHeader(
                    amount: widget.amount,
                    currency: widget.currency,
                    orderNo: widget.orderNo,
                  ),
                  /*Expanded(
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: LoginScreen(
                        safeXPayBloc: safeXPayBloc,
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: IndexedStack(
                      index: currentIndex,
                      //children: _children,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> proceedPayment(BuildContext context) async {
    String strTransactionType = '${MerchantConstants.agId}'
        '|${MerchantConstants.merchantId}'
        '|${widget.orderNo}'
        '|${widget.amount}'
        '|${widget.countryCode}'
        '|${widget.currency}'
        '|${widget.transactionType}'
        '|${widget.successUrl}'
        '|${widget.failureUrl}'
        '|${widget.channel}';
    String? transactionDetails =
        CryptoUtils.encrypt(strTransactionType, MerchantConstants.merchantKey);

    String? pgDetails =
        CryptoUtils.encrypt(widget.pgDetails, MerchantConstants.merchantKey);

    String? cardDetails =
        CryptoUtils.encrypt(widget.cardDetails, MerchantConstants.merchantKey);

    String? custDetails = CryptoUtils.encrypt(
        widget.customerDetails, MerchantConstants.merchantKey);

    String? billDetails =
        CryptoUtils.encrypt(widget.billDetails, MerchantConstants.merchantKey);

    String? shipDetails =
        CryptoUtils.encrypt(widget.shipDetails, MerchantConstants.merchantKey);

    String? itemDetails =
        CryptoUtils.encrypt(widget.itemDetails, MerchantConstants.merchantKey);

    String? otherDetails =
        CryptoUtils.encrypt(widget.otherDetails, MerchantConstants.merchantKey);
    String? htmlContent = "";

    String? hashRequest = MerchantConstants.merchantId +
        '~${widget.orderNo}' +
        '~${widget.amount}' +
        '~${widget.countryCode}' +
        '~${widget.currency}';

    String? hash = CryptoUtils.sha256Checksum(hashRequest);

    String? merchant_request = strTransactionType +
        '~' +
        widget.pgDetails +
        '~' +
        widget.cardDetails +
        '~' +
        widget.customerDetails +
        '~' +
        widget.billDetails +
        '~' +
        widget.shipDetails +
        '~' +
        widget.itemDetails +
        '~' +
        widget.upiDetails +
        '~' +
        widget.otherDetails;

    //for testing


    print('safexpay --- hashrequest ' + hashRequest);
    print('safexpay --- hash ' + hash.toString());
    print('safexpay --- merchant_request ' + merchant_request);
    print('safexpay --- merchant_Enc ' + CryptoUtils.encrypt(merchant_request,MerchantConstants.merchantKey)!);
    print('safexpay --- hashEnc ' + CryptoUtils.encrypt(hash.toString(),MerchantConstants.merchantKey)!);

    /*htmlContent = RequestPage.checksumPage(
        CryptoUtils.encrypt(merchant_request,MerchantConstants.merchantKey)!,
        CryptoUtils.encrypt(hash.toString(),MerchantConstants.merchantKey)!,
        MerchantConstants.merchantId,
        StringConstants.baseUrl);*/

    htmlContent = RequestPage.page(
        transactionDetails,
        pgDetails,
        cardDetails,
        custDetails,
        billDetails,
        shipDetails,
        itemDetails,
        otherDetails,
        MerchantConstants.merchantId,
        StringConstants.baseUrl);
    //if(widget.upiDetails.isEmpty) {
    /* htmlContent = await safeXPayBloc.makePayment(
          transactionDetails,
          pgDetails,
          cardDetails,
          custDetails,
          billDetails,
          shipDetails,
          itemDetails,
          otherDetails,
          MerchantConstants.merchantId,
          context);*/
    /*}else {
      String? upiDetails =
      CryptoUtils.encrypt(widget.upiDetails, MerchantConstants.merchantKey);
      htmlContent = RequestPage.page(
          transactionDetails,
          pgDetails,
          cardDetails,
          custDetails,
          billDetails,
          shipDetails,
          itemDetails,
          otherDetails,
          upiDetails,
          MerchantConstants.merchantId,
          StringConstants.baseUrl);
    }*/

    if (htmlContent != null) {
      MaterialPageRoute route = MaterialPageRoute(
          builder: (BuildContext context) => MakePaymentWebViewScreen(
                makePaymentHtmlContent: htmlContent,
                webViewSuccessResponseUrl: widget.successUrl,
                webViewFailureResponseUrl: widget.failureUrl,
                isMerchantHosted: true,
              ));
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) { Navigator.pushReplacement(context, route);});
    }
  }
}
