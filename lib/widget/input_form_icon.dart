import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.icon,
    this.hintText,
    this.isPassword,
    this.size,
  }) : super(key: key);

  final Icon icon;
  final String? hintText;
  final bool? isPassword;
  final double? size;

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
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: icon,
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
