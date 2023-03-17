import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/widgets/border_text_field.dart';
import 'constants/constants.dart';
import 'observer/safeXPay_payment_callback_observable.dart';

class AppHeader extends StatefulWidget {
  AppHeader(
      {required this.amount,
      required this.currency,
      required this.orderNo,
      this.showAmountCard = true,
      this.paymentId = '',
      this.transactionId = '',
      this.paymentStatus = '',
      this.statusMessage = '',
      this.status = false});

  final String orderNo;
  final double amount;
  final String currency;
  final bool showAmountCard;

  final String paymentId;
  final String transactionId;
  final String paymentStatus;
  final String statusMessage;
  final bool status;

  @override
  _AppHeader createState() => _AppHeader();
}

class _AppHeader extends State<AppHeader> {
  String?
      nwImage; // = 'https://pbs.twimg.com/profile_images/890513269131051008/x41AXaED_400x400.jpg';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.loose,
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: UIConstants.headerHeight,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 55,
                child: Container(
                  color: UIConstants.buttonBackgroundColor,
                ),
              ),
              Expanded(
                flex: 45,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: UIConstants.headerHeight,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(8, 48, 8, 8),
          child: Row(
            children: [
              /*Expanded(
                  flex: 4,
                  child: ),*/
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                color: Colors.white,
                elevation: 3.0,
                child: Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    child: nwImage == null
                        ? Image.asset(
                            'packages/safexpay/img/ic_safexpay.png',
                            fit: BoxFit.contain,
                            // height: 20,
                            // width: 20,
                          )
                        : Image.network(
                            nwImage!,
                            fit: BoxFit.contain,
                          )
                    // color: Colors.white,
                    ),
              ),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const SizedBox(width: 12,),
                            Image.asset(
                              'packages/safexpay/img/safexpay_icon.png',
                              fit: BoxFit.contain,
                              height: 45,
                              // width: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            if (widget.showAmountCard)
                              GestureDetector(
                                child: Container(
                                  // margin: EdgeInsets.only(bottom: 50),
                                  height: 90,
                                  width: 40,
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context1) {
                                            return MyCancelAlertDialog(context: context,);
                                          });
                                    },
                                    child: Icon(Icons.close,
                                        size: 30, color: Colors.white),
                                  ),
                                ),
                                onTap: () {
                                  showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context1) {
                                        return MyCancelAlertDialog(context: context,);
                                      });

                                  /*if (!widget.showAmountCard) {
                                    SafeXPayPaymentCallbackObservable
                                        callbackObservable =
                                        SafeXPayPaymentCallbackObservable();
                                    if (widget.status) {
                                      callbackObservable
                                          .notifyOnPaymentComplete(
                                              widget.orderNo,
                                              widget.transactionId,
                                              widget.paymentId,
                                              widget.paymentStatus);
                                    } else {
                                      callbackObservable
                                          .notifyOnInitiatePaymentFailure(
                                              widget.statusMessage);
                                    }
                                  }*/
                                  // Navigator.of(context).pop();
                                },
                              )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 70,
                        child: widget.showAmountCard
                            ? Card(
                                color: Colors.white,
                                elevation: 3.0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  // width: MediaQuery.of(context).size.height,
                                  // color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: const TextStyle(
                                            color: Color(0xFF687982),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.0),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${widget.amount} ${widget.currency}",
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                                letterSpacing: 2,
                                                color: Color(0xFF687982),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.0),
                                          ),
                                          // const SizedBox(width: 8,),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Order No. ${widget.orderNo}",
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                                color: Color(0xFF687982),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}

enum CancelOptionGroup {
  MODIFY,
  CARD_NOT_LISTED,
  INCOMPATIBLE_CURRENCY,
  OTHER_PAYMENT_OPTION,
  NO_INTEREST,
  OTHER_REASON,
}

class MyCancelAlertDialog extends StatefulWidget {
  MyCancelAlertDialog({required this.context});

  final BuildContext context;

  @override
  _MyCancelAlertDialogState createState() => _MyCancelAlertDialogState();
}

class _MyCancelAlertDialogState extends State<MyCancelAlertDialog>
    with AutomaticKeepAliveClientMixin<MyCancelAlertDialog> {
  CancelOptionGroup? _radioGroupValue;
  TextEditingController _otherReasonController = TextEditingController();
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Card(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          elevation: 3,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text('Why you want to cancel this transaction?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  getRadioButton(
                      'I want to modify existing order.', CancelOptionGroup.MODIFY),
                  getRadioButton('My bank/card is not listed in payment options.',
                      CancelOptionGroup.CARD_NOT_LISTED),
                  getRadioButton('Currency is not compatible with payment gateway.',
                      CancelOptionGroup.INCOMPATIBLE_CURRENCY),
                  getRadioButton('I want to pay with other payment option.',
                      CancelOptionGroup.OTHER_PAYMENT_OPTION),
                  getRadioButton('No more interested to purchase this product.',
                      CancelOptionGroup.NO_INTEREST),
                  getRadioButton('Other reason', CancelOptionGroup.OTHER_REASON),
                  BorderTextField(
                      context: context,
                      key: Key('key_other_reason'),
                      hintText: 'Please enter your cancellation reason here',
                      inputType: TextInputType.text,
                      controller: _otherReasonController,
                      enabled: enabled,
                      textInputAction: TextInputAction.done,
                      maxLines: 5,
                      maxLength: null,
                      validator: (String? value) {
                        return null;
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                SafeXPayPaymentCallbackObservable
                                callbackObservable =
                                SafeXPayPaymentCallbackObservable();
                                callbackObservable
                                    .notifyOnPaymentCancelled();
                                Navigator.of(context).pop();
                                Navigator.of(widget.context).pop();
                              },
                              child: Text(
                                'CANCEL TRANSACTION',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns radio button widget for each sort parameter for device events
  Widget getRadioButton(String labelText, CancelOptionGroup value) {
    return ListTile(
      onTap: () {
        _handleRadioValueChange(value);
      },
      leading: Radio<CancelOptionGroup>(
        value: value,
        groupValue: _radioGroupValue,
        onChanged: _handleRadioValueChange,
      ),
      title: Text(labelText),
      dense: true,
    );
  }

  void _handleRadioValueChange(CancelOptionGroup? value) {
    setState(() {
      _radioGroupValue = value;
      if(value == CancelOptionGroup.OTHER_REASON){
        enabled = true;
      } else {
        enabled = false;
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
