import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

/// Class used to provide input field with rectangular border.
/// User can set prefix icon or other style for input field
/// User can make obscure text with provided obscuring character
class BorderTextField extends StatefulWidget {
  BorderTextField(
      {@required BuildContext? context,
        @required this.key,
        @required this.controller,
        this.enabled = true,
        this.inputType = TextInputType.text,
        this.obscureText = false,
        this.obscureCharacter = '•',
        this.maxLength = 50,
        this.maxLines = 1,
        TextStyle? style,
        TextStyle? labelStyle,
        this.textInputAction = TextInputAction.done,
        this.autoValidateMode = false,
        this.labelText,
        this.hintText,
        this.prefixIcon,
        required this.validator,
        this.isDense = false,
        this.textCapitalization = TextCapitalization.none,
        this.showSuffixIcon = false,
        this.showText,
        this.focusNode,
        this.onEditingComplete,
        this.onTextChanged,
        this.filled = true}) {
    this.style = style ??= Theme.of(context!).textTheme.bodyText2;
    this.labelStyle = labelStyle ??= Theme.of(context!).textTheme.bodyText2;
  }

  final Key? key;
  final TextEditingController? controller;
  final bool enabled;
  final TextInputType inputType;
  final bool obscureText;
  final String obscureCharacter;
  final int? maxLength;
  final int maxLines;
  TextStyle? style;
  TextStyle? labelStyle;
  final TextInputAction textInputAction;
  final bool autoValidateMode;
  late String? labelText;
  late String? hintText;
  late Widget? prefixIcon;
  final bool showSuffixIcon;
  final Function(String? text) validator;
  final Function(String? text)? onTextChanged;
  final bool
  isDense; // Used to remove extra padding between text and input border
  final TextCapitalization textCapitalization;
  final Function(bool show)? showText;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final filled;

  @override
  _BorderTextFieldState createState() => _BorderTextFieldState();
}

class _BorderTextFieldState extends State<BorderTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      focusNode: widget.focusNode,
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.inputType,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscureCharacter,
      style: widget.style,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      autovalidateMode: widget.autoValidateMode
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      autofocus: false,
      autocorrect: false,
      textAlign: TextAlign.start,
      validator: (String? text) {
        return widget.validator(text);
      },
      textCapitalization: widget.textCapitalization,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onTextChanged,
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: Color(0xFFf7fcff),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.showSuffixIcon
            ? IconButton(
            icon: widget.obscureText
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              widget.showText!(!widget.obscureText);
            })
            : null,
        labelText: widget.labelText,
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.only(
            bottom: 10.0, left: 10.0, top: 10.0, right: 10.0),
        labelStyle: widget.labelStyle,
        isDense: widget.isDense,
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: UIConstants.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3.0,
            color: UIConstants.textFieldBorderColor,
          ),
        ),
      ),
    );
  }
}