import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'logic/safex_pay_bloc.dart';
import 'model/saved_card_response.dart';
import 'observer/safexpay_observable.dart';

class PaymentMode extends StatefulWidget {
  static const String routeName = "/PaymentMode";
  final SafeXPayBloc safeXPayBloc;

  PaymentMode({Key? key, required this.safeXPayBloc}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<PaymentMode> {
  List<PaymentMethodModel> _paymentMethodList = <PaymentMethodModel>[];

  @override
  void initState() {
    super.initState();
    // _generateStaticPaymentMethodList();
  }

  void _generateStaticPaymentMethodList() {
    final PaymentMethodModel model1 = PaymentMethodModel(
        "packages/safexpay/img/ic_card.png", "CREDIT/DEBIT/ATM CARD");
    final PaymentMethodModel model2 =
        PaymentMethodModel("packages/safexpay/img/ic_bank.png", "NET BANKING");
    final PaymentMethodModel model3 =
        PaymentMethodModel("packages/safexpay/img/ic_wallet.png", "WALLETS");
    final PaymentMethodModel model4 =
        PaymentMethodModel("packages/safexpay/img/ic_upi.png", "UPI");

    _paymentMethodList.add(model1);
    _paymentMethodList.add(model2);
    _paymentMethodList.add(model3);
    _paymentMethodList.add(model4);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
    /*Scaffold(
      backgroundColor: Colors.white,
      body: _buildWidget(),
    );*/
  }

  Widget _buildWidget() {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - UIConstants.headerHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _savedCardWidget(context),
              Text(
                "PAYMENT METHODS",
                style: const TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
              const SizedBox(
                height: 8,
              ),
              StreamBuilder<bool>(
                  stream: widget.safeXPayBloc.payModeListController,
                  builder: (context, snapshot) {
                    bool isListAvailable = false;
                    if (snapshot.hasData) {
                      isListAvailable = snapshot.data!;
                    }
                    if (isListAvailable) {
                      _paymentMethodList.clear();
                      _paymentMethodList
                          .addAll(widget.safeXPayBloc.paymentMethodList);
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _paymentMethodList.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return InkWell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: UIConstants.iconBackColor,
                                      child: IconButton(
                                        icon: Image.asset(
                                            '${_paymentMethodList[index].icon}'),
                                        onPressed: () => () {},
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _paymentMethodList[index]
                                            .paymentMethod
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey[300],
                                      size: 18.0,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                if (_paymentMethodList[index].preference == 1) {
                                  final SafeXPayObservable safeXPayObservable =
                                      SafeXPayObservable();
                                  safeXPayObservable.notifyOnIndexChanged(2);
                                } else if (_paymentMethodList[index]
                                        .preference ==
                                    2) {
                                  final SafeXPayObservable safeXPayObservable =
                                      SafeXPayObservable();
                                  safeXPayObservable.notifyOnIndexChanged(3);
                                } else if (_paymentMethodList[index]
                                        .preference ==
                                    3) {
                                  final SafeXPayObservable safeXPayObservable =
                                      SafeXPayObservable();
                                  safeXPayObservable.notifyOnIndexChanged(4);
                                } else if (_paymentMethodList[index]
                                        .preference ==
                                    4) {
                                  final SafeXPayObservable safeXPayObservable =
                                      SafeXPayObservable();
                                  safeXPayObservable.notifyOnIndexChanged(5);
                                }
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSavedCard(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.safeXPayBloc.savedCardsListController,
        builder: (context, snapshot) {
          bool showList = false;
          if (snapshot.hasData && snapshot.data != null) {
            showList = snapshot.data!;
          }
          if (showList) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: widget.safeXPayBloc.savedCardsList.length,
                padding: const EdgeInsets.only(top: 4),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  SavedCard savedCard =
                  widget.safeXPayBloc.savedCardsList[index];
                  return Card(
                    margin: const EdgeInsets.only(top: 4),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${savedCard.nameOnCard}',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${savedCard.firstSixDigits}******${savedCard.lastFourDigits}',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      'Exp. Date ${savedCard.expiryMonth}/${savedCard.expiryYear}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'CVV ***',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.safeXPayBloc.cardNameController.text =
                                  savedCard.nameOnCard;
                              widget.safeXPayBloc.cardNumberController.text =
                              '${savedCard.firstSixDigits}******${savedCard.lastFourDigits}';
                              widget.safeXPayBloc.expiryDateController.text =
                              '${savedCard.expiryMonth}/${savedCard.expiryYear.substring(2)}';
                              final SafeXPayObservable safeXPayObservable =
                              SafeXPayObservable();
                              safeXPayObservable.notifyOnIndexChanged(2);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.circle,
              size: 12,
              color: Colors.lightBlue,
            ),
          );
        });
  }

  Widget _savedCardWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "SAVED CARDS",
          style: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
        ),
        const SizedBox(
          height: 8,
        ),
        _getSavedCard(context),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class PaymentMethodModel {
  int preference;
  String icon;
  String paymentMethod;
  PaymentMethodModel(this.icon, this.paymentMethod, {this.preference = 1});
}
