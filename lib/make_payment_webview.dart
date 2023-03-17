import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/crypto_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constants/merchant_constants.dart';
import 'observer/safeXPay_payment_callback_observable.dart';

class MakePaymentWebViewScreen extends StatefulWidget {
  final String? makePaymentHtmlContent;
  final String? webViewSuccessResponseUrl;
  final String? webViewFailureResponseUrl;
  final bool isMerchantHosted;


  MakePaymentWebViewScreen(
      {Key? key,
      required this.makePaymentHtmlContent,
      required this.webViewSuccessResponseUrl,
      required this.webViewFailureResponseUrl,
      required this.isMerchantHosted})
      : super(key: key);

  @override
  _MakePaymentWebViewScreenState createState() =>
      _MakePaymentWebViewScreenState();
}

class _MakePaymentWebViewScreenState extends State<MakePaymentWebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SafeXPayPaymentCallbackObservable callbackObservable =
            SafeXPayPaymentCallbackObservable();
        callbackObservable.notifyOnPaymentCancelled();
        Navigator.pop(context, false);
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: WebView(
          initialUrl: 'about:blank',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            // _controller.complete(webViewController);
            _loadHtmlData();
          },
          // ignore: prefer_collection_literals
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {

            if (url.contains("txn_response") && url.contains("pg_details") && url.contains("fraud_details") && url.contains("other_details")) {
              var uri = Uri.parse(url);
              print("safexpay-----response_txnR"+uri.toString());
              String txnResponse = uri.queryParameters['txn_response']!;
              String pgDetails = uri.queryParameters['pg_details']!;
              String otherDetails = uri.queryParameters['other_details']!;
              String froudDetails = uri.queryParameters['fraud_details']!;

              print("safexpay-----response_txnResponse"+txnResponse);
              print("safexpay-----response_pgDetails"+pgDetails);
              print("safexpay-----response_otherDetails"+otherDetails);
              print("safexpay-----response_froudDetails"+froudDetails);
              String strTxnResponse = CryptoUtils.decrypt(
                  txnResponse, MerchantConstants.merchantKey)!;


            //  String strTxnResponse  =   Uri.decodeComponent(tempstrTxnResponse);

              String strPgDetails = CryptoUtils.decrypt(
                  pgDetails, MerchantConstants.merchantKey)!;

              String strOthersDetails = CryptoUtils.decrypt(
                  otherDetails, MerchantConstants.merchantKey)!;

              List<String> responseArray = strTxnResponse.split('|');
              List<String> strPgDetailsArray = strPgDetails.split('|');
              List<String> strOtherDetailsArray = strOthersDetails.split('|');
              String paymode = "";
              String udf1 = "";
              String udf2 = "";
              String udf3 = "";
              String udf4 = "";
              String udf5 = "";
              if (strPgDetailsArray.isNotEmpty &&
                  strPgDetailsArray.length >= 3) {
                paymode = strPgDetailsArray[2];
              }

              if (strOtherDetailsArray.isNotEmpty &&
                  strOtherDetailsArray.length >= 4) {
                udf1 = strOtherDetailsArray[0];
                udf2 = strOtherDetailsArray[1];
                udf3 = strOtherDetailsArray[2];
                udf4 = strOtherDetailsArray[3];
                //udf5 = strOtherDetailsArray[4];
                if (strOtherDetailsArray.length > 4) {
                  udf5 = strOtherDetailsArray[4];
                }
              }

              //  print('blocking navigation to $udf1');
              if (responseArray.isNotEmpty && responseArray.length >= 13) {
                String paygate = responseArray[0];
                String merchantId = responseArray[1];
                String orderNo = responseArray[2];
                String amount = responseArray[3];
                String country = responseArray[4];
                String currency = responseArray[5];
                String date = responseArray[6];
                String time = responseArray[7];
                String paymentId = responseArray[8];
                String transactionId = responseArray[9];
                String strStatus = responseArray[10];
                String statusCode = responseArray[11];
                String statusMessage = responseArray[12];
                print( 'safexpay---Status : $statusMessage');
                bool status = true;
                if (strStatus.contains('Failed')) {
                  status = false;
                }

                //if (widget.isMerchantHosted) {
                SafeXPayPaymentCallbackObservable callbackObservable =
                    SafeXPayPaymentCallbackObservable();
                if (status) {
                  callbackObservable.notifyOnPaymentComplete(
                      orderNo,
                      transactionId,
                      paymentId,
                      strStatus,
                      date,
                      time,
                      paymode,
                      amount,
                      udf1,
                      udf2,
                      udf3,
                      udf4,
                      udf5);
                } else {
                  callbackObservable.notifyOnInitiatePaymentFailure(
                      orderNo,
                      transactionId,
                      paymentId,
                      strStatus,
                      date,
                      time,
                      paymode,
                      amount,
                      udf1,
                      udf2,
                      udf3,
                      udf4,
                      udf5);
                }
              Navigator.of(context).pop(true);
                /*} else {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => PaymentStatusScreen(
                          amount: amount,
                          currency: currency,
                          orderNo: orderNo,
                          paymentId: paymentId,
                          transactionId: transactionId,
                          paymentStatus: strStatus,
                          date: date,
                          time: time,
                          paymode: paymode,
                          statusMessage: statusMessage,
                          status: status));
                  Navigator.pushReplacement(context, route);
                }*/
              }
              //return NavigationDecision.prevent;
            }
            //print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            //print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          /*Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );*/
        });
  }

  void _loadHtmlData() {
    _webViewController.loadUrl(Uri.dataFromString(
            widget.makePaymentHtmlContent!,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
