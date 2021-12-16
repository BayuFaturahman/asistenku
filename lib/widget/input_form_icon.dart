import 'package:asistenku/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFormIcon extends StatelessWidget {
  const InputFormIcon({
    Key? key,
    required this.icon,
    this.hintText,
    this.isPassword,
    this.size,
    this.hintTextStyle,
    this.controller,
    this.validate,
  }) : super(key: key);

  final Icon icon;
  final String? hintText;
  final bool? isPassword;
  final double? size;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validate;





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
      child: TextFormField(
        obscureText: isPassword ?? false,
        controller: controller,
        validator: validate ??
                (value) {
          if(value == null){
            return 'Data isian harus di isi!';
          }
              // if (!isValidPassword(password: value.toString())) {
              //   return '- Password minimal 8 karakter\n' +
              //       '- Diawali huruf kapital\n' +
              //       '- Terdiri dari huruf besar, huruf kecil, angka dan symbol (!@#\$%^&*(),.?":{}|<>])';
              // }
            },

        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintText: hintText,
          
          hintStyle: hintTextStyle ??
              const TextStyle(color: Color(0xffE5E5E5), fontSize: 14),
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
