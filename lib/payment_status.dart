import 'package:flutter/material.dart';

import 'AppHeader.dart';
import 'observer/safeXPay_payment_callback_observable.dart';

class PaymentStatusScreen extends StatefulWidget {
  PaymentStatusScreen(
      {required this.amount,
      required this.currency,
      required this.orderNo,
      required this.paymentId,
      required this.transactionId,
      required this.paymentStatus,
      required this.date,
      required this.time,
      required this.paymode,
      required this.udf1,
      required this.udf2,
      required this.udf3,
      required this.udf4,
      required this.udf5,
      required this.statusMessage,
      required this.status});

  //final List<String> txnResult;
  final String amount;
  final String currency;
  final String orderNo;
  final String paymentId;
  final String transactionId;
  final String paymentStatus;
  final String date;
  final String time;
  final String paymode;
  final String udf1;
  final String udf2;
  final String udf3;
  final String udf4;
  final String udf5;
  final String statusMessage;
  final bool status;

  @override
  _PaymentStatusScreenState createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SafeXPayPaymentCallbackObservable callbackObservable =
            SafeXPayPaymentCallbackObservable();
        if (widget.status) {
          callbackObservable.notifyOnPaymentComplete(
              widget.orderNo,
              widget.transactionId,
              widget.paymentId,
              widget.paymentStatus,
              widget.date,
              widget.time,
              widget.paymode,
              widget.amount,
              widget.udf1,
              widget.udf2,
              widget.udf3,
              widget.udf4,
              widget.udf5);
        } else {
          callbackObservable.notifyOnInitiatePaymentFailure(
              widget.orderNo,
              widget.transactionId,
              widget.paymentId,
              widget.paymentStatus,
              widget.date,
              widget.time,
              widget.paymode,
              widget.amount,
              widget.udf1,
              widget.udf2,
              widget.udf3,
              widget.udf4,
              widget.udf5);
        }
        Navigator.pop(context, false);
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(
              amount: 0.0,
              currency: '',
              orderNo: '',
              showAmountCard: false,
            ),
            const SizedBox(height: 24),
            Text(
              'Payment of Amount',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.currency} ${widget.amount}',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
            const SizedBox(height: 24),
            Container(
                height: 120,
                width: 120,
                child: widget.status
                    ? Image.asset(
                        'packages/safexpay/img/success.png',
                        color: Colors.lightBlueAccent,
                      )
                    : Image.asset(
                        'packages/safexpay/img/failed.png',
                        color: Colors.red,
                      )),
            const SizedBox(height: 24),
            widget.status
                ? Text(
                    'TRANSACTION SUCCESSFUL',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                  )
                : Text(
                    'TRANSACTION FAILED',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0),
                  ),
            const SizedBox(height: 16),
            Text(
              'Order No : ${widget.orderNo}',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
