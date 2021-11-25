import 'package:asistenku/shared/constants/colors.dart';
import 'package:asistenku/shared/constants/styles.dart';
import 'package:flutter/material.dart';


class ButtonIconHorizontal extends StatelessWidget {
  // final String icon;
  final String text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final Function() onTap;

  const ButtonIconHorizontal({
    Key? key,
    // required this.icon,
    required this.text,
    this.textStyle,
    this.height,
    this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.all(Insets.sm),
            onPressed: onTap,
            icon: Icon(Icons.map,size: IconSizes.lg,color: AppColor.secondColor.shade400,)
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: textStyle ?? TextStyles.small2,
            ),
          )
        ],
      ),
    );
  }
}
