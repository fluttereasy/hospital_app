import 'package:flutter/material.dart';
import 'package:hospital_app/upi_screen.dart';
import 'package:hospital_app/wallets_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'AppHeader.dart';
import 'NetBanking.dart';
import 'PaymentMode.dart';
import 'Screens/Login & Sign Up/login_screen.dart';
import 'cardDetails.dart';
import 'constants/strings.dart';
import 'constants/utility.dart';
import 'logic/safex_pay_bloc.dart';
import 'login_screen.dart';
import 'observer/safexpay_observable.dart';
import 'observer/safexpay_observer.dart';

class SafeXPayGateway extends StatefulWidget {
  SafeXPayGateway(
      {required this.orderNo,
      required this.amount,
      required this.currency,
      required this.transactionType,
      required this.channel,
      required this.successUrl,
      required this.failureUrl,
      required this.countryCode});

  final String orderNo;
  final double amount;
  final String currency;
  final String transactionType;
  final String channel;
  final String successUrl;
  final String failureUrl;
  final String countryCode;

  bool userDetailsSet = false;
  bool UdfSet = false;
  String? name;
  String? emailId;
  String? mobile;

  String? UDF1;
  String? UDF2;
  String? UDF3;
  String? UDF4;
  String? UDF5;

  bool cardPaymentFlag = true;
  bool netBankingPaymentFlag = true;
  bool walletPaymentFlag = true;
  bool upiPaymentFlag = true;

  void setUserDetails(
      {required String name, required String emailId, required String mobile}) {
    userDetailsSet = true;
    this.name = name;
    this.emailId = emailId;
    this.mobile = mobile;
  }

  void setUdf(
      {required String UDF1,
      required String UDF2,
      required String UDF3,
      required String UDF4,
      required String UDF5}) {
    UdfSet = true;
    this.UDF1 = UDF1;
    this.UDF2 = UDF2;
    this.UDF3 = UDF3;
    this.UDF4 = UDF4;
    this.UDF5 = UDF5;
  }

  void allowedPaymentMethods({
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

  @override
  _SafeXPayGatewayState createState() => _SafeXPayGatewayState();
}

class _SafeXPayGatewayState extends State<SafeXPayGateway>
    implements SafeXPayObserver {
  late SafeXPayBloc safeXPayBloc;
  late List<Widget> _children;
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

    if (widget.userDetailsSet) {
      safeXPayBloc.saveUserDetails(
          name: widget.name!, emailId: widget.emailId!, mobile: widget.mobile!);
      safeXPayBloc.getMerchantPayModes();
      safeXPayBloc.getSavedCards();
    }

    if (widget.UdfSet) {
      safeXPayBloc.saveUdf(
          udf1: widget.UDF1!,
          udf2: widget.UDF2!,
          udf3: widget.UDF3!,
          udf4: widget.UDF4!,
          udf5: widget.UDF5!);
    }

    safeXPayBloc.setAllowedPaymentMethods(
        allowCardPayment: widget.cardPaymentFlag,
        allowNetBankingPayment: widget.netBankingPaymentFlag,
        allowWalletPayment: widget.walletPaymentFlag,
        allowUPIPayment: widget.upiPaymentFlag);
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

  Future<void> generateChildrenList() async {
    _children = <Widget>[
      LoginScreen(safeXPayBloc: safeXPayBloc),
      PaymentMode(safeXPayBloc: safeXPayBloc),
      CardDetails(safeXPayBloc: safeXPayBloc),
      NetBanking(safeXPayBloc: safeXPayBloc),
      WalletsScreen(safeXPayBloc: safeXPayBloc),
      UPIScreen(safeXPayBloc: safeXPayBloc),
      // LoginScreen(safeXPayBloc: safeXPayBloc),
    ];
    if (widget.userDetailsSet) {
      final SafeXPayObservable safeXPayObservable = SafeXPayObservable();
      safeXPayObservable.notifyOnIndexChanged(1);
    }
  }

  @override
  void dispose() {
    _safeXPayObservable.unRegister(this);
    safeXPayBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /*showDialog<void>(
            context: context,
            builder: (BuildContext context1) {
              return MyCancelAlertDialog(
                context: context,
              );
            });
        return true;*/
        if (currentIndex == 0 || currentIndex == 1) {
          showDialog<void>(
              context: context,
              builder: (BuildContext context1) {
                return MyCancelAlertDialog(
                  context: context,
                );
              });
        }
        return Future.value(false);
      },
      child: new Scaffold(
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
                        children: _children,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
