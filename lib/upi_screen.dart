import 'package:flutter/material.dart';
import 'package:hospital_app/utils/crypto_utils.dart';
import 'package:hospital_app/utils/shared_preference_utils.dart';
import 'package:hospital_app/utils/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/constants.dart';
import 'constants/merchant_constants.dart';
import 'constants/strings.dart';
import 'constants/utility.dart';
import 'logic/RequestPage.dart';
import 'logic/safex_pay_bloc.dart';
import 'make_payment_webview.dart';
import 'model/merchant_pay_mode_schemes_response.dart';
import 'observer/safexpay_observable.dart';
import 'widgets/border_text_field.dart';

enum UPIOptionGroup {
  PHONE_PAY,
  G_PAY,
  PAYTM,
  OTHER,
}

/*bool isVPA(String input) =>
    RegExp(r'[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}')
        .hasMatch(input);*/
class UPIScreen extends StatefulWidget {
  final SafeXPayBloc safeXPayBloc;

  UPIScreen({Key? key, required this.safeXPayBloc}) : super(key: key);

  @override
  _UPIScreenState createState() => _UPIScreenState();
}

class _UPIScreenState extends State<UPIScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController upiIdController = TextEditingController();
  bool autoValidate = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //GlobalKey<FormState> _key  = GlobalKey<FormState>();

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
        // height: MediaQuery.of(context).size.height - UIConstants.headerHeight,
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
                      child: Image.asset('packages/safexpay/img/ic_upi.png'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'UPI',
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
            // _getUpiWidgets(context),
            _getOtherUpIWidgets(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (isUpi(upiIdController.text.toString().trim())) {
                            proceedPayment(context);
                          } else {
                            Utility.showSnackBarMessage(
                                state: _scaffoldKey.currentState!,
                                message: 'Please enter a valid UPI ID.');
                          }
                          /*if (_key.currentState!.validate()) {
                           // proceedPayment(context);
                          } else {
                            setState(() {
                              autoValidate = true;
                            });
                          }*/
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

  Widget _getUpiWidgets(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "Select any UPI payment option",
              style: const TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
            ),
            const SizedBox(height: 8),
            getRadioButton('packages/safexpay/img/ic_phone_pay.png',
                UPIOptionGroup.PHONE_PAY),
            getRadioButton(
                'packages/safexpay/img/ic_g_pay.png', UPIOptionGroup.G_PAY),
            getRadioButton(
                'packages/safexpay/img/ic_paytm.png', UPIOptionGroup.PAYTM),
            getRadioButton('Other', UPIOptionGroup.OTHER),
            if (enabled)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Pay By Any App or Bank UPI Id",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset('packages/safexpay/img/ic_upi_icon.png',
                            height: 65),
                        const SizedBox(width: 8),
                        Expanded(
                          child: BorderTextField(
                              context: context,
                              key: Key('upi_id_key'),
                              hintText: 'Enter UPI ID',
                              autoValidateMode: false,
                              inputType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              controller: upiIdController,
                              textInputAction: TextInputAction.next,
                              maxLines: 1,
                              isDense: true,
                              filled: false,
                              validator: (String? value) {
                                return Validator.validateUpiId(upiId: value);
                              }),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 4),
                    /*Align(
                      alignment: Alignment.center,*/
                    Visibility(
                      visible: false,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Verify Id',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              shape: RoundedRectangleBorder(),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20))),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _getOtherUpIWidgets(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Pay By Any App or Bank UPI Id",
                style: const TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Image.asset('packages/safexpay/img/ic_upi_icon.png',
                    height: 65),
                const SizedBox(width: 8),
                Expanded(
                  child: BorderTextField(
                      context: context,
                      key: Key('upi_id_key'),
                      hintText: 'Enter UPI ID',
                      autoValidateMode: autoValidate,
                      inputType: TextInputType.text,
                      controller: upiIdController,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      isDense: true,
                      filled: false,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter UPI Id';
                        }
                        return null;
                      }),
                ),
              ],
            ),
            /*const SizedBox(height: 4),
            Align(

              alignment: Alignment.center,*/
            Visibility(
              visible: false,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Verify Id',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20))),
            )
          ],
        ),
      ),
    );
  }

  UPIOptionGroup? _radioGroupValue;

  Widget getRadioButton(String upiIcon, UPIOptionGroup value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          _handleRadioValueChange(value);
        },
        child: Row(
          children: [
            Radio<UPIOptionGroup>(
              value: value,
              groupValue: _radioGroupValue,
              onChanged: _handleRadioValueChange,
            ),
            value == UPIOptionGroup.OTHER
                ? Text(
                    upiIcon,
                    style: const TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  )
                : Image.asset(upiIcon),
          ],
        ),
      ),
    );
    /*return ListTile(
      onTap: () {
        _handleRadioValueChange(value);
      },
      leading: Radio<UPIOptionGroup>(
        value: value,
        groupValue: _radioGroupValue,
        onChanged: _handleRadioValueChange,
      ),
      title: value == UPIOptionGroup.OTHER ? Text(upiIcon) : Image.asset(
          upiIcon),
      dense: true,
    );*/
  }

  bool enabled = false;

  void _handleRadioValueChange(UPIOptionGroup? value) {
    setState(() {
      _radioGroupValue = value;
      if (value == UPIOptionGroup.OTHER) {
        enabled = true;
      } else {
        enabled = false;
      }
    });
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

    if (widget.safeXPayBloc.upiPaymentList != null &&
        widget.safeXPayBloc.upiPaymentList.isNotEmpty) {
      for (PaymentModeDetails paymentMode
          in widget.safeXPayBloc.upiPaymentList) {
        if (paymentMode.schemeDetailsResponse != null) {
          schemeId = paymentMode.schemeDetailsResponse!.schemeId!;
          pgId = paymentMode.pgDetailsResponse!.pgId!;
          break;
        }
      }
    }

    String strPgDetails = '$pgId|UP|$schemeId|$emiMonths';




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

    String? upiDetails = CryptoUtils.encrypt(
        upiIdController.text.toString().trim(), MerchantConstants.merchantKey);

    String? otherDetails =
       // CryptoUtils.encrypt('||||', MerchantConstants.merchantKey);
        CryptoUtils.encrypt(strOtherDetails, MerchantConstants.merchantKey);
    String strBillDetails = '||||';
    String strShipDetails = '||||||';
    String strItemDetails = '||';

    String strCardDetails = '||||';
    String strUpiDetails = '$upiIdController.text.toString().trim()';
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

    /* htmlContent = RequestPage.page(
        encryptedTransactionDetails,
        encryptedPgDetails,
        encryptedCardDetails,
        encryptedUserDetails,
        billDetails,
        shipDetails,
        itemDetails,
        otherDetails,

        MerchantConstants.merchantId,
        StringConstants.baseUrl);*/
    //debugPrint('baseURL : $baseUrl');

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

  bool isUpi(String value) {
    String p = r'[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(value);
  }
}
