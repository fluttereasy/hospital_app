import 'dart:async';
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

class NetBanking extends StatefulWidget {
  static const String routeName = "/NetBanking";
  final SafeXPayBloc safeXPayBloc;

  NetBanking({Key? key, required this.safeXPayBloc}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<NetBanking> {
  TextEditingController editingController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String>? _bankNameList;
  List<String>? _filterSearchList;
  String bankName = "Bank Name";

  @override
  void initState() {
    super.initState();
    // _generateStaticBankList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _generateStaticBankList() {
    _bankNameList = <String>[];
    _bankNameList = [
      "Demo Bank",
      "ICICI Bank",
      "HDFC Bank",
      "Kotak Bank",
      "Federal Bank",
      "Corporation Bank",
      "Yes Bank",
      "Vijaya Bank"
    ];
    _bankNameList!.sort();
    _filterSearchList = <String>[];
    _filterSearchList!.addAll(_bankNameList!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - UIConstants.headerHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          // AppHeader(),
          // SizedBox(height: 50),
          Expanded(
            child: Column(
              children: [
                StreamBuilder<bool>(
                    stream: widget.safeXPayBloc.nbStaticListController.stream,
                    builder: (context, snapshot) {
                      bool isListPresent = false;
                      if (snapshot.hasData) {
                        isListPresent = snapshot.data!;
                      }
                      if (isListPresent)
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
                                widget.safeXPayBloc.nbStaticPaymentList.length,
                            itemBuilder: (BuildContext context, int index) {
                              PaymentModeDetails paymentModeDetails = widget
                                  .safeXPayBloc.nbStaticPaymentList[index];
                              String? bankName;
                              String? bankIcon;
                              switch (paymentModeDetails
                                  .pgDetailsResponse!.pgName) {
                                case 'State Bank Of India':
                                  bankName = 'SBI';
                                  bankIcon = 'packages/safexpay/img/SBI.png';
                                  break;
                                case 'ICICI Bank':
                                  bankName = 'ICICI';
                                  bankIcon = 'packages/safexpay/img/ICICI.png';
                                  break;
                                case 'YES Bank':
                                  bankName = 'Yes';
                                  bankIcon = 'packages/safexpay/img/Yes.png';
                                  break;
                                case 'Axis Bank':
                                  bankName = 'Axis';
                                  bankIcon = 'packages/safexpay/img/Axis.png';
                                  break;
                                case 'HDFC Bank':
                                  bankName = 'HDFC';
                                  bankIcon = 'packages/safexpay/img/Hdfc.png';
                                  break;
                                case 'Kotak Bank':
                                  bankName = 'Kotak';
                                  bankIcon = 'packages/safexpay/img/Kotak.png';
                                  break;
                              }
                              if (bankName != null && bankIcon != null) {
                                return getCardView(
                                    bankIcon, bankName, paymentModeDetails);
                              }
                              return Container();
                            });
                      else
                        return Container();
                    }),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    _modalBottomSheetMenu();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 3,
                              offset: Offset(0.0, 3)),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          StreamBuilder<PaymentModeDetails>(
                              stream: widget.safeXPayBloc
                                  .selectedNBPaymentMethodController.stream,
                              builder: (context, snapshot) {
                                bankName = 'Bank Name';
                                if (snapshot.hasData && snapshot.data != null) {
                                  bankName =
                                      snapshot.data!.pgDetailsResponse!.pgName!;
                                }
                                return Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        bankName,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[600],
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /*const SizedBox(
                height: 24,
              ),*/
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (widget.safeXPayBloc.selectedNBPaymentMethod !=
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
        ]),
      ),
    );
  }

  Widget getCardView(
      String asset, String bankName, PaymentModeDetails paymentModeDetails) {
    Color backgroundColor = Colors.white;
    if (widget.safeXPayBloc.selectedNBPaymentMethod != null) {
      backgroundColor = paymentModeDetails.pgDetailsResponse!.pgId ==
              widget
                  .safeXPayBloc.selectedNBPaymentMethod!.pgDetailsResponse!.pgId
          ? UIConstants.primaryColor
          : Colors.white;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.safeXPayBloc.selectedNBPaymentMethod = paymentModeDetails;
          widget.safeXPayBloc.selectedNBPaymentMethodController
              .add(paymentModeDetails);
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
              Image.asset(
                '$asset',
                height: (MediaQuery.of(context).size.width) / 5.8, //55,
                width: (MediaQuery.of(context).size.width) / 5.8, //55,
                // width: 55,
              ),
              SizedBox(height: 8),
              Text(
                '$bankName',
                style: const TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
            ],
          )),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return new Container(
            decoration: new BoxDecoration(
              color: Colors.transparent,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(140.0),
                topRight: const Radius.circular(140.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.94,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(5))),
                      padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    autocorrect: false,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search bank",
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.grey),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          bottom: 12,
                                          top: 0,
                                          right: 0),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.97),
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    // controller: editingController,
                                    onChanged: (value) {
                                      //print("First text field: $value");
                                      _performSearch(value);
                                    },
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  _buildBankNameListView(),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBankNameListView() {
    //debugPrint('Filtered search list is ${widget.safeXPayBloc.filteredNBPaymentList.length}');
    return Expanded(
      child: StreamBuilder<bool>(
          stream: widget.safeXPayBloc.nbFilterListController.stream,
          builder: (context, snapshot) {
            return ListView.separated(
              // shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[350],
                height: 0.8,
              ),
              padding: EdgeInsets.only(left: 8, right: 8),
              itemCount: widget.safeXPayBloc.filteredNBPaymentList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _bankNameCell(
                    widget.safeXPayBloc.filteredNBPaymentList[index]);
              },
            );
          }),
    );
  }

  Widget _bankNameCell(PaymentModeDetails paymentModeDetails) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.safeXPayBloc.selectedNBPaymentMethod = paymentModeDetails;
          widget.safeXPayBloc.selectedNBPaymentMethodController
              .add(paymentModeDetails);
        });
        Navigator.pop(context, false);
      },
      child: Padding(
          // height: 45,
          // alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(12),
          child: Text(
            paymentModeDetails.pgDetailsResponse!.pgName!,
            style: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          )),
    );
  }

  _performSearch(String _query) {
    widget.safeXPayBloc.filteredNBPaymentList.clear();
    if (_query.isNotEmpty) {
      for (PaymentModeDetails paymentModeDetails
          in widget.safeXPayBloc.nbPaymentMode.paymentModeDetailsList!) {
        if (paymentModeDetails.pgDetailsResponse!.pgName!
            .toLowerCase()
            .contains(_query.toLowerCase())) {
          widget.safeXPayBloc.filteredNBPaymentList.add(paymentModeDetails);
        }
      }
    } else {
      widget.safeXPayBloc.filteredNBPaymentList
          .addAll(widget.safeXPayBloc.nbPaymentMode.paymentModeDetailsList!);
    }
    widget.safeXPayBloc.nbFilterListController.add(true);
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

    //print('strTransactionType content is $strTransactionType');

    late String pgId;
    late String schemeId;
    int emiMonths = 7;
    pgId =
        widget.safeXPayBloc.selectedNBPaymentMethod!.pgDetailsResponse!.pgId!;
    schemeId = widget
        .safeXPayBloc.selectedNBPaymentMethod!.schemeDetailsResponse!.schemeId!;

    //debugPrint('Pg id is $pgId && scheme Id is $schemeId');
    String strPgDetails = '$pgId|NB|$schemeId|$emiMonths';
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
    /*String? upiDetails =
        CryptoUtils.encrypt('', MerchantConstants.merchantKey);*/
    String? otherDetails =
        CryptoUtils.encrypt(strOtherDetails, MerchantConstants.merchantKey);


    String strBillDetails = '||||';
    String strShipDetails = '||||||';
    String strItemDetails = '||';
    String strUpiDetails = '';
    String strCardDetails = '||||';
    String? htmlContent = "";

    /*String? otherDetails =
    CryptoUtils.encrypt('||||', MerchantConstants.merchantKey);*/

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

  /*  String? htmlContent = await widget.safeXPayBloc.makePayment(
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
       // upiDetails,
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
