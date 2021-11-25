import 'package:asistenku/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.label,
    this.size,
    this.color,
    this.labelStyle,
    this.height,
    this.margin,
    this.enable = true,
    this.icon,
    this.iconColor,
    this.radius,
  }) : super(key: key);

  final Function() onPressed;
  final Color? color;
  final bool enable;
  final double? height;
  final String? icon;
  final Color? iconColor;
  final String label;
  final TextStyle? labelStyle;
  final EdgeInsets? margin;
  final double? size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        height: height ?? 50,
        width: size ?? double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: enable ? color ?? Color(0XFF5296D6) : AppColor.bodyColor.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 10.0),
              ),
            ),
            child: Text(
              label,
              style: labelStyle ?? const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )));
  }
}
