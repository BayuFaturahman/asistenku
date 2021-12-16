
import 'package:asistenku/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    Key? key,
    required this.icon,
    this.hintText,
    this.isPassword,
    this.size, this.hintTextStyle, this.controller,
  }) : super(key: key);

  final Icon icon;
  final String? hintText;
  final bool? isPassword;
  final double? size;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;



  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size ?? 350,
        height: 51,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 25,
              offset: Offset(0, 5),
              spreadRadius: -25,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: TextField(
          controller: widget.controller,
          obscureText: showPassword,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000912),
            ),
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle ??
                const TextStyle(color: Color(0xffE5E5E5), fontSize: 14),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: widget.icon,
            suffixIcon: showPassword == true
                ? IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () =>
                        setState(() => showPassword = !showPassword),
                  )
                : IconButton(
                    icon:  const Icon(
                      Icons.remove_red_eye,
                      color: AppColor.primaryColor,
                    ),
                    onPressed: () =>
                        setState(() => showPassword = !showPassword),
                  ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 75,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ));
  }
}
