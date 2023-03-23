


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/SAFEXPAY%20LIBRARY/logic/safex_pay_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SAFEXPAY LIBRARY/constants/constants.dart';
import 'SAFEXPAY LIBRARY/constants/merchant_constants.dart';
import 'SAFEXPAY LIBRARY/constants/strings.dart';
import 'SAFEXPAY LIBRARY/constants/utility.dart';
import 'SAFEXPAY LIBRARY/logic/RequestPage.dart';
import 'SAFEXPAY LIBRARY/model/merchant_pay_mode_schemes_response.dart';
import 'SAFEXPAY LIBRARY/observer/safexpay_observable.dart';
import 'SAFEXPAY LIBRARY/utils/crypto_utils.dart';
import 'SAFEXPAY LIBRARY/utils/shared_preference_utils.dart';
import 'SAFEXPAY LIBRARY/widgets/border_text_field.dart';
import 'make_payment_webview.dart';

class CardDetails extends StatefulWidget {
  static const String routeName = "/CardDetails";
  final SafeXPayBloc safeXPayBloc;

  CardDetails({Key? key, required this.safeXPayBloc}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

enum CardType {
  Master,
  Visa,
  Verve,
  Others, // Any other card issuer
  Invalid // We'll use this when the card is invalid
}

class _MyHomePageState extends State<CardDetails> {
  bool _loading = false;
  bool checkBoxValue = false;
  bool autoValidate = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showSavedCards = false;

  FocusNode cvvFocusNode = FocusNode();
  FocusNode cardNumberNode = FocusNode();
  FocusNode expiryDateNode = FocusNode();
  FocusNode cardHolderNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: _buildWidget(context)),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.safeXPayBloc.autoValidateController.stream,
        builder: (context, snapshot) {
          autoValidate = false;
          if(snapshot.hasData && snapshot.data != null){
            autoValidate = snapshot.data!;
            _formKey = GlobalKey<FormState>();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                            widget.safeXPayBloc.cardNameController.clear();
                            widget.safeXPayBloc.cardNumberController.clear();
                            widget.safeXPayBloc.expiryDateController.clear();
                            widget.safeXPayBloc.cvvNumberController.clear();
                            widget.safeXPayBloc.autoValidateController.add(false);

                            cvvFocusNode.unfocus();
                            cardNumberNode.unfocus();
                            expiryDateNode.unfocus();
                            cardHolderNode.unfocus();

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
                            child: Image.asset(
                                'packages/safexpay/img/ic_card.png'),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              'CREDIT/DEBIT/ATM CARD',
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
                  /*Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          color: Color(0xFFd9e7f7),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "CREDIT/DEBIT/ATM CARD",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),*/
                  /*SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                    child: Container(
                      // padding: EdgeInsets.only(left: 20, right: 10),
                      height: 40,
                      child: Row(
                        children: [
                          Container(
                            child: Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "SAVED CARDS",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[600],
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
                  SizedBox(height: 20),
                  Text(
                    "ADD NEW CARD",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),
                  SizedBox(height: 24),
                  BorderTextField(
                      context: context,
                      key: Key('card_holder_name'),
                      labelText: 'Name on Card',
                      autoValidateMode: autoValidate,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      controller: widget.safeXPayBloc.cardNameController,
                      textInputAction: TextInputAction.next,
                      focusNode: cardHolderNode,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return StringConstants.ENTER_VALID_CARD_NAME;
                        }
                        return null;
                      }),
                  SizedBox(height: 24),
                  BorderTextField(
                    context: context,
                    key: Key('card_number'),
                    labelText: 'Card Number',
                    autoValidateMode: autoValidate,
                    inputType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    controller: widget.safeXPayBloc.cardNumberController,
                    textInputAction: TextInputAction.next,
                    focusNode: cardNumberNode,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return StringConstants.ENTER_VALID_CARD_NUMBER;
                      } else if(value.contains('*')) {
                        return 'Please replace * with actual card number';
                      } else if (value.length != 19) {
                        return StringConstants.ENTER_INVALID_CARD_NUMBER;
                      }
                      return null;
                    },
                    onTextChanged: (String? text) {
                      //debugPrint('Card number on text changed ${text!.length}');
                      if (text!.isNotEmpty) {
                        widget.safeXPayBloc
                            .getCardTypeAndPGDetails(text.replaceAll(' ', ''));
                        if (text.length == 7) {
                          widget.safeXPayBloc.getCardType(text.replaceAll(' ', ''));
                        }
                        if (text.length == 19)
                          FocusScope.of(context).requestFocus(expiryDateNode);
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: BorderTextField(
                          context: context,
                          key: Key('card_expiry'),
                          labelText: 'Exp.Date:MM/YY',
                          autoValidateMode: autoValidate,
                          inputType: TextInputType.number,
                          textCapitalization: TextCapitalization.words,
                          controller: widget.safeXPayBloc.expiryDateController,
                          textInputAction: TextInputAction.next,
                          focusNode: expiryDateNode,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return StringConstants.ENTER_EXPIRY_DATE;
                            } else {
                              if (value.length != 5) {
                                return StringConstants.ENTER_VALID_EXPIRY_DATE;
                              } else {
                                DateTime dateTime = DateTime.now();
                                String month = value.split('/').first;
                                String year = value.split('/').last;
                                if (int.parse('20$year') >= dateTime.year) {
                                  if (int.parse('20$year') == dateTime.year) {
                                    if (int.parse(month) >= dateTime.month) {
                                      return null;
                                    } else {
                                      return StringConstants.ENTER_VALID_EXPIRY_DATE;
                                    }
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return StringConstants.ENTER_VALID_EXPIRY_DATE;
                                }
                              }
                            }
                          },
                          onTextChanged: (String? text) {
                            //debugPrint('expiry date is $text and length is ${text!.length}');
                            if (text!.isNotEmpty && text.length == 5) {
                              //debugPrint('expiry date is $text and length is ${text.length}');
                              cvvFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: BorderTextField(
                          context: context,
                          key: Key('card_cvv_number'),
                          labelText: 'CVV',
                          autoValidateMode: autoValidate,
                          inputType: TextInputType.number,
                          textCapitalization: TextCapitalization.words,
                          controller: widget.safeXPayBloc.cvvNumberController,
                          textInputAction: TextInputAction.done,
                          focusNode: cvvFocusNode,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return StringConstants.ENTER_VALID_CVV;
                            } else if (value.length != 3) {
                              return StringConstants.ENTER_INVALID_CVV;
                            }
                            return null;
                          },
                          onTextChanged: (String? text) {
                            if (text!.isNotEmpty && text.length == 3) {
                              Utility.hideKeyboard(context: context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4),
                    child: Row(
                      children: <Widget>[
                        new Checkbox(
                            value: checkBoxValue,
                            activeColor: Colors.grey,
                            onChanged: (bool? newValue) {
                              setState(() {
                                checkBoxValue = newValue!;
                              });
                            }),
                        Text(
                          'Save this card',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            proceedPayment(context);
                          } else {
                            /*setState(() {
                            autoValidate = true;
                          });*/
                            widget.safeXPayBloc.autoValidateController.add(true);
                          }
                        },
                        child: Text(
                          'PROCEED',
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
          );
        }
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

    if (widget.safeXPayBloc.paymentModeList != null &&
        widget.safeXPayBloc.paymentModeList!.isNotEmpty) {
      for (PaymentMode paymentMode in widget.safeXPayBloc.paymentModeList!) {
        if (paymentMode.payModeId.toString().toLowerCase() ==
            widget.safeXPayBloc.selectedCardType.toString().toLowerCase()) {
          if (paymentMode.paymentModeDetailsList != null &&
              paymentMode.paymentModeDetailsList!.isNotEmpty) {
            for (PaymentModeDetails paymentModeDetails
            in paymentMode.paymentModeDetailsList!) {
              if (paymentModeDetails.schemeDetailsResponse!.schemeName!
                  .toLowerCase() ==
                  widget.safeXPayBloc.selectedCreditCardType
                      .toString()
                      .split('.')
                      .last
                      .toLowerCase()) {
                schemeId = paymentModeDetails.schemeDetailsResponse!.schemeId!;
                pgId = paymentModeDetails.pgDetailsResponse!.pgId!;
                break;
              }
            }
          }
          break;
        }
      }
    }

    //debugPrint('Pg id is $pgId && scheme Id is $schemeId && card type is ${widget.safeXPayBloc.selectedCardType}');
    String strPgDetails =
        '$pgId|${widget.safeXPayBloc.selectedCardType}|$schemeId|$emiMonths';
    String? encryptedPgDetails =
    CryptoUtils.encrypt(strPgDetails, MerchantConstants.merchantKey);

    String cardNumber =
    widget.safeXPayBloc.cardNumberController.text.trim().replaceAll(' ', '');
    List<String> expiry =
    widget.safeXPayBloc.expiryDateController.text.trim().split('/');
    String month = expiry[0];
    String year = expiry[1];
    String strCardDetails = '$cardNumber'
        '|$month'
        '|20$year'
        '|${widget.safeXPayBloc.cvvNumberController.text.trim()}'
        '|${widget.safeXPayBloc.cardNameController.text.trim()}';
    String? encryptedCardDetails =
    CryptoUtils.encrypt(strCardDetails, MerchantConstants.merchantKey);

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString(SharedPreferenceUtils.userName);
    String? email = preferences.getString(SharedPreferenceUtils.userEmail);
    String? mobile = preferences.getString(SharedPreferenceUtils.userMobile);

    String? UDF1 = preferences.getString(SharedPreferenceUtils.Udf1);
    String? UDF2 = preferences.getString(SharedPreferenceUtils.Udf2);
    String? UDF3 = preferences.getString(SharedPreferenceUtils.Udf3);
    String? UDF4 = preferences.getString(SharedPreferenceUtils.Udf4);
    String? UDF5 = preferences.getString(SharedPreferenceUtils.Udf5);

    String strUserDetails = '$name|$email|$mobile||Y';
    String strOtherDetails = '$UDF1|$UDF2|$UDF3|$UDF4|$UDF5';
    String strBillDetails = '||||';
    String strShipDetails = '||||||';
    String strItemDetails = '||';
    String strUpiDetails = '';
    String? htmlContent = "";
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

    /*Map<String, dynamic> jsonMap = {
      'txn_details':encryptedTransactionDetails,
      'pg_details':encryptedPgDetails,
      'card_details': encryptedCardDetails,
      'cust_details': encryptedUserDetails,
      'bill_details': billDetails,
      'ship_details': shipDetails,
      'item_details': itemDetails,
      'other_details': otherDetails,
      'me_id':MerchantConstants.merchantId
    };*/

    String? hashRequest = MerchantConstants.merchantId +
        '~${widget.safeXPayBloc.orderNo}' +
        '~${widget.safeXPayBloc.amount}' +
        '~${widget.safeXPayBloc.countryCode}' +
        '~${widget.safeXPayBloc.currency}';

    String? hash = CryptoUtils.sha256Checksum(hashRequest);

    // print('safexpay --- strTransactionType ' + strTransactionType);

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
    /* print('safexpay --- hashrequest ' + hashRequest);
    print('safexpay --- hash ' + hash.toString());
    print('safexpay --- merchant_request ' + merchant_request);
    print('safexpay --- merchant_Enc ' + CryptoUtils.encrypt(merchant_request,MerchantConstants.merchantKey)!);
    print('safexpay --- hashEnc ' + CryptoUtils.encrypt(hash.toString(),MerchantConstants.merchantKey)!);*/

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

class MaskedTextController extends TextEditingController {
  MaskedTextController(
      {String? text, required this.mask, Map<String, RegExp>? translator})
      : super(text: text) {
    this.translator = translator ?? MaskedTextController.getDefaultTranslator();

    addListener(() {
      final String previous = _lastUpdatedText;
      if (beforeChange(previous, this.text)) {
        updateText(this.text);
        afterChange(previous, this.text);
      } else {
        updateText(_lastUpdatedText);
      }
    });

    updateText(this.text);
  }

  String mask;

  late Map<String, RegExp> translator;

  Function afterChange = (String previous, String next) {};
  Function beforeChange = (String previous, String next) {
    return true;
  };

  String _lastUpdatedText = '';

  void updateText(String text) {
    if (text.isNotEmpty) {
      this.text = _applyMask(mask, text);
    } else {
      this.text = '';
    }

    _lastUpdatedText = this.text;
  }

  void updateMask(String mask, {bool moveCursorToEnd = true}) {
    this.mask = mask;
    updateText(text);

    if (moveCursorToEnd) {
      this.moveCursorToEnd();
    }
  }

  void moveCursorToEnd() {
    final String text = _lastUpdatedText;
    selection = TextSelection.fromPosition(TextPosition(offset: text.length));
  }

  @override
  set text(String newText) {
    if (super.text != newText) {
      super.text = newText;
      moveCursorToEnd();
    }
  }

  static Map<String, RegExp> getDefaultTranslator() {
    return <String, RegExp>{
      'A': RegExp(r'[A-Za-z]'),
      '0': RegExp(r'[0-9]'),
      '@': RegExp(r'[A-Za-z0-9]'),
      '*': RegExp(r'.*')
    };
  }

  String _applyMask(String? mask, String value) {
    String result = '';

    int maskCharIndex = 0;
    int valueCharIndex = 0;

    while (true) {
      // if mask is ended, break.
      if (maskCharIndex == mask!.length) {
        break;
      }

      // if value is ended, break.
      if (valueCharIndex == value.length) {
        break;
      }

      final String maskChar = mask[maskCharIndex];
      final String valueChar = value[valueCharIndex];

      // value equals mask, just set
      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
        continue;
      }

      // apply translator if match
      if (translator.containsKey(maskChar)) {
        if (translator[maskChar]!.hasMatch(valueChar)) {
          result += valueChar;
          maskCharIndex += 1;
        }

        valueCharIndex += 1;
        continue;
      }

      // not masked value, fixed char on mask
      result += maskChar;
      maskCharIndex += 1;
      continue;
    }

    return result;
  }
}
