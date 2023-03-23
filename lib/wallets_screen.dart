import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SAFEXPAY LIBRARY/constants/constants.dart';
import 'SAFEXPAY LIBRARY/constants/merchant_constants.dart';
import 'SAFEXPAY LIBRARY/constants/strings.dart';
import 'SAFEXPAY LIBRARY/constants/utility.dart';
import 'SAFEXPAY LIBRARY/logic/RequestPage.dart';
import 'SAFEXPAY LIBRARY/logic/safex_pay_bloc.dart';
import 'SAFEXPAY LIBRARY/model/merchant_pay_mode_schemes_response.dart';
import 'SAFEXPAY LIBRARY/observer/safexpay_observable.dart';
import 'SAFEXPAY LIBRARY/utils/crypto_utils.dart';
import 'SAFEXPAY LIBRARY/utils/shared_preference_utils.dart';
import 'make_payment_webview.dart';
class WalletsScreen extends StatefulWidget {
  final SafeXPayBloc safeXPayBloc;

  WalletsScreen({Key? key, required this.safeXPayBloc}) : super(key: key);

  @override
  _WalletsScreenState createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - UIConstants.headerHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      final SafeXPayObservable safeXPayObservable =
                          SafeXPayObservable();
                      safeXPayObservable.notifyOnIndexChanged(1);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'BACK TO PAYMENT METHODS',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 3,
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      color: UIConstants.iconBackColor,
                      child: Image.asset('packages/safexpay/img/ic_wallet.png'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'WALLETS',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<bool>(
                  stream: widget.safeXPayBloc.walletListController.stream,
                  builder: (context, snapshot) {
                    bool isListPresent = false;
                    if (snapshot.hasData) {
                      isListPresent = snapshot.data!;
                    }
                    if (isListPresent) {
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              widget.safeXPayBloc.walletPaymentList.length,
                          itemBuilder: (BuildContext context, int index) {
                            PaymentModeDetails paymentModeDetails =
                                widget.safeXPayBloc.walletPaymentList[index];
                            return getCardView(paymentModeDetails);
                          });
                    } else
                      return Container();
                  }),
            ),
            /* const SizedBox(
              height: 24,
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (widget.safeXPayBloc.selectedWalletPaymentMethod !=
                              null) {
                            proceedPayment(context);
                          } else {
                            Utility.showSnackBarMessage(
                                state: _scaffoldKey.currentState!,
                                message:
                                    'Please select some payment method in order to continue the transaction');
                          }
                        },
                        child: Text(
                          'PAY NOW',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: UIConstants.buttonBackgroundColor,
                            shape: RoundedRectangleBorder(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24))),
                  ),
                ],
              ),
            ),
            /*const SizedBox(
              height: 24,
            ),*/
          ],
        ),
      ),
    );
  }

  Widget getCardView(PaymentModeDetails paymentModeDetails) {
    Color backgroundColor = Colors.white;
    if (widget.safeXPayBloc.selectedWalletPaymentMethod != null) {
      backgroundColor = paymentModeDetails.pgDetailsResponse!.pgId ==
              widget.safeXPayBloc.selectedWalletPaymentMethod!
                  .pgDetailsResponse!.pgId
          ? UIConstants.primaryColor
          : Colors.white;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.safeXPayBloc.selectedWalletPaymentMethod = paymentModeDetails;
        });
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8.0),
            color: backgroundColor,
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.lightBlueAccent.withAlpha(20),
                height: (MediaQuery.of(context).size.width) / 5.8, //55,
                width: (MediaQuery.of(context).size.width) / 5.8, //55,
                child: Image.network(
                  '${paymentModeDetails.pgDetailsResponse!.pgIcon}',

                  // width: 55,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${paymentModeDetails.pgDetailsResponse!.pgName!}',
                style: const TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
            ],
          )),
    );
  }

  Future<void> proceedPayment(BuildContext context) async {
    String strTransactionType = '${MerchantConstants.agId}'
        '|${MerchantConstants.merchantId}'
        '|${widget.safeXPayBloc.orderNo}'
        '|${widget.safeXPayBloc.amount}'
        '|${widget.safeXPayBloc.countryCode}'
        '|${widget.safeXPayBloc.currency}'
        '|${widget.safeXPayBloc.transactionType}'
        '|${widget.safeXPayBloc.successUrl}'
        '|${widget.safeXPayBloc.failureUrl}'
        '|${widget.safeXPayBloc.channel}';
    String? encryptedTransactionDetails =
        CryptoUtils.encrypt(strTransactionType, MerchantConstants.merchantKey);

    late String pgId;
    late String schemeId;
    int emiMonths = 7;
    pgId = widget
        .safeXPayBloc.selectedWalletPaymentMethod!.pgDetailsResponse!.pgId!;
    schemeId = widget.safeXPayBloc.selectedWalletPaymentMethod!
        .schemeDetailsResponse!.schemeId!;

    //debugPrint('Pg id is $pgId && scheme Id is $schemeId');
    String strPgDetails = '$pgId|WA|$schemeId|$emiMonths';
    String? encryptedPgDetails =
        CryptoUtils.encrypt(strPgDetails, MerchantConstants.merchantKey);

    String? encryptedCardDetails =
        CryptoUtils.encrypt('||||', MerchantConstants.merchantKey);

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString(SharedPreferenceUtils.userName);
    String? email = preferences.getString(SharedPreferenceUtils.userEmail);
    String? mobile = preferences.getString(SharedPreferenceUtils.userMobile);

    String? UDF1 = preferences.getString(SharedPreferenceUtils.Udf1);
    String? UDF2 = preferences.getString(SharedPreferenceUtils.Udf2);
    String? UDF3 = preferences.getString(SharedPreferenceUtils.Udf3);
    String? UDF4 = preferences.getString(SharedPreferenceUtils.Udf4);
    String? UDF5 = preferences.getString(SharedPreferenceUtils.Udf5);

    String strUserDetails = '$name|$email|$mobile|12324342|Y';

    String strOtherDetails = '$UDF1|$UDF2|$UDF3|$UDF4|$UDF5';
    String? encryptedUserDetails =
        CryptoUtils.encrypt(strUserDetails, MerchantConstants.merchantKey);

    String? billDetails =
        CryptoUtils.encrypt('||||', MerchantConstants.merchantKey);
    String? shipDetails =
        CryptoUtils.encrypt('||||||', MerchantConstants.merchantKey);
    String? itemDetails =
        CryptoUtils.encrypt('||', MerchantConstants.merchantKey);
    String? otherDetails =
        CryptoUtils.encrypt(strOtherDetails, MerchantConstants.merchantKey);
    /*String? upiDetails =
    CryptoUtils.encrypt('', MerchantConstants.merchantKey);*/

    String strBillDetails = '||||';
    String strShipDetails = '||||||';
    String strItemDetails = '||';
    String strUpiDetails = '';
    String strCardDetails = '||||';
    String? htmlContent = "";

    String? hashRequest = MerchantConstants.merchantId +
        '~${widget.safeXPayBloc.orderNo}' +
        '~${widget.safeXPayBloc.amount}' +
        '~${widget.safeXPayBloc.countryCode}' +
        '~${widget.safeXPayBloc.currency}';

    String? hash = CryptoUtils.sha256Checksum(hashRequest);

    String? merchant_request = strTransactionType +
        '~' +
        strPgDetails +
        '~' +
        strCardDetails +
        '~' +
        strUserDetails +
        '~' +
        strBillDetails +
        '~' +
        strShipDetails +
        '~' +
        strItemDetails +
        '~' +
        strUpiDetails +
        '~' +
        strOtherDetails;

    htmlContent = RequestPage.checksumPage(
        CryptoUtils.encrypt(merchant_request,MerchantConstants.merchantKey)!,
        CryptoUtils.encrypt(hash.toString(),MerchantConstants.merchantKey)!,
        MerchantConstants.merchantId,
        StringConstants.baseUrl);


    /*String? htmlContent = await widget.safeXPayBloc.makePayment(
        encryptedTransactionDetails,
        encryptedPgDetails,
        encryptedCardDetails,
        encryptedUserDetails,
        billDetails,
        shipDetails,
        itemDetails,
        otherDetails,
        MerchantConstants.merchantId,
        context);*/
    //debugPrint('html content is $htmlContent');

   /* String? htmlContent = RequestPage.page(
        encryptedTransactionDetails,
        encryptedPgDetails,
        encryptedCardDetails,
        encryptedUserDetails,
        billDetails,
        shipDetails,
        itemDetails,
        otherDetails,
        upiDetails,
        MerchantConstants.merchantId,
        StringConstants.baseUrl);*/

    if (htmlContent != null) {
      MaterialPageRoute route = MaterialPageRoute(
          builder: (BuildContext context) => MakePaymentWebViewScreen(
                makePaymentHtmlContent: htmlContent,
            webViewSuccessResponseUrl: widget.safeXPayBloc.successUrl,
            webViewFailureResponseUrl: widget.safeXPayBloc.failureUrl,
                isMerchantHosted: false,
              ));
      Navigator.pushReplacement(context, route);
    }
  }
}
