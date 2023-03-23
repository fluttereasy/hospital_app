import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppHeader.dart';
import 'PaymentMode.dart';
import 'SAFEXPAY LIBRARY/constants/constants.dart';
import 'SAFEXPAY LIBRARY/constants/strings.dart';
import 'SAFEXPAY LIBRARY/logic/safex_pay_bloc.dart';
import 'SAFEXPAY LIBRARY/observer/safexpay_observable.dart';
import 'SAFEXPAY LIBRARY/utils/validator.dart';
import 'SAFEXPAY LIBRARY/widgets/border_text_field.dart';
import 'internet_connectivity.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";
  final SafeXPayBloc safeXPayBloc;

  LoginScreen({Key? key, required this.safeXPayBloc}) : super(key: key);

  // PageController? controller;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  late InternetConnectivity _internetConnectivity;
  bool _loading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  void initState() {
    super.initState();
    // _internetConnectivity = new InternetConnectivity();
    // CryptoUtils.encrypt('{"logo":"https://test.avantgardepayments.com/agresources/agmerchant/resources/views/img/delta-logo.png","integration_type":"JS Checkout","merchantThemeDetails":{"heading_bgcolor":"#283c93ff","bgcolor":"#ffffff","menu_color":"#0073CC","footer_color":"#0f1011"}}', 'U7BuLoPuNcR3hiZQnhzaP6qglwGIE9RF/fRF2EkF/hI=');
    // CryptoUtils.decrypt("EgXC0Qjw%2BmQOH5cLDoUqrLQzeBzyXWM9OFfIJgu00P80J8PYW0zd%2FGQIa7UnnoqFhEGZP%2FmVqPi3iLkTLECl7Julzjf668GvMlrdLSwgr8vZAv6klncICIKae2iXpK%2FsayUofiq%2FZqd9RIbl5ZmNrIWMs2icLAPFhMXQB%2BX6URU%3D", 'rXbmCVAcefiPyWZz9wVs9WBYPbaYVfDV4VxwowyJBHg=');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "CONTACT DETAILS",
            style: TextStyle(
                color: UIConstants.textColorSecondary,
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
          ),
          const SizedBox(
            height: 40,
          ),
          BorderTextField(
              context: context,
              key: Key('name'),
              labelText: StringConstants.label_name,
              prefixIcon: Icon(Icons.account_circle_sharp),
              autoValidateMode: autoValidate,
              inputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              controller: _fullNameController,
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return StringConstants.name_empty_msg;
                }
                return null;
              }),
          const SizedBox(
            height: 24,
          ),
          BorderTextField(
              context: context,
              key: Key('email_address'),
              labelText: StringConstants.label_email,
              prefixIcon: Icon(Icons.email_outlined),
              autoValidateMode: autoValidate,
              inputType: TextInputType.emailAddress,
              controller: _emailController,
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                return Validator.validateEmailAddress(email: value);
              }),
          const SizedBox(
            height: 24,
          ),
          BorderTextField(
              context: context,
              key: Key('mobile_number'),
              labelText: StringConstants.label_mobile,
              prefixIcon: Icon(Icons.phone),
              autoValidateMode: autoValidate,
              inputType: TextInputType.numberWithOptions(),
              controller: _phoneController,
              textInputAction: TextInputAction.done,
              validator: (String? value) {
                return Validator.validateMobileNumber(number: value);
              }),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    /*widget.controller!.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);*/
                    await widget.safeXPayBloc.saveUserDetails(
                        name: _fullNameController.text.trim(),
                        emailId: _emailController.text.trim(),
                        mobile: _phoneController.text.trim());
                    /*MaterialPageRoute<PaymentMode> route = MaterialPageRoute(
                      builder: (BuildContext context) => PaymentMode(
                        safeXPayBloc: widget.safeXPayBloc,
                      ),
                    );
                    Navigator.push(context, route);*/
                    final SafeXPayObservable safeXPayObservable = SafeXPayObservable();
                    safeXPayObservable.notifyOnIndexChanged(1);
                    widget.safeXPayBloc.getMerchantPayModes();
                  } else {
                    setState(() {
                      autoValidate = true;
                    });
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
    );
  }

}

