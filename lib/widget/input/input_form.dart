import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    this.hintText,
    this.isPassword,
    this.size,
    this.hintTextStyle,
    required this.controller,
  }) : super(key: key);

  final String? hintText;
  final bool? isPassword;
  final double? size;
  final TextStyle? hintTextStyle;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 350,
      height: 51,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
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
        obscureText: isPassword ?? false,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefix: const Text('00'),
          hintText: hintText,
          hintStyle: hintTextStyle ??
              const TextStyle(
                color: Color(0xffE5E5E5),
                fontSize: 14,
              ),
          fillColor: Colors.white,
          filled: true,
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
      ),
    );
  }
}
