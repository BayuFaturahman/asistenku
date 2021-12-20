import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';

class InputPasswordPrimary extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  const InputPasswordPrimary({
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  _InputPasswordPrimaryState createState() => _InputPasswordPrimaryState();
}

class _InputPasswordPrimaryState extends State<InputPasswordPrimary> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != ''
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: Insets.sm,
                  ),
                  child: Text(
                    widget.label,
                    style: TextStyles.body2,
                  ),
                )
              : verticalSpace(0),
          TextFormField(
            enableInteractiveSelection: true,
            cursorColor: AppColor.primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange,
            keyboardType: TextInputType.text,
            controller: widget.controller,
            obscureText: _obsecureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            validator: widget.validate,
            style: TextStyles.body1,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.whiteColor,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Insets.med, vertical: Insets.sm),
                hintText: widget.hintText,
                border: BorderStyles.enableTextField,
                focusedBorder: BorderStyles.focusTextField,
                enabledBorder: BorderStyles.enableTextField,
                errorBorder: BorderStyles.errorTextField,
                disabledBorder: BorderStyles.disableTextField,
                errorMaxLines: 5,
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints:
                    BoxConstraints(minHeight: 30, minWidth: 50),
                suffixIcon: InkWell(
                  child: _obsecureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onTap: onTap,
                ),
                hintStyle: TextStyles.body1
                    .copyWith(color: AppColor.bodyColor.shade500)),
          ),
        ],
      ),
    );
  }

  void onTap() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
