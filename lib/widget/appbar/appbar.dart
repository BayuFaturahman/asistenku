import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? icon;
  final Widget? center;
  final Widget? bottom;
  final Widget? flexibleSpace;

  final Color? color;
  final Color? colorTitle;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final double elevation;
  final Function()? onBackPressed;
  final bool useLeading;
  CustomAppBar(
      {Key? key,
      this.leadingIcon,
      required this.title,
      this.color,
      this.colorTitle,
      this.icon,
      this.center,
      this.bottom,
      this.flexibleSpace,
      this.actions,
      this.elevation = 0,
      this.onBackPressed,
      this.useLeading = true})
      : super(key: key);

  @override
  final Size preferredSize =
      Size.fromHeight(kToolbarHeight * scale); // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: widget.elevation,
      backgroundColor: widget.color ?? AppColor.bodyColor.shade50,
      leading: widget.useLeading
          ? widget.leadingIcon ??
              IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: widget.colorTitle ?? AppColor.bodyColor.shade500,
                    size: IconSizes.lg,
                  ),
                  onPressed: widget.onBackPressed ?? () => Get.back())
          : null,
      title: widget.center ??
          Text(
            widget.title,
            style: TextStyles.subtitle1.copyWith(
                color: widget.colorTitle ?? AppColor.bodyColor.shade500),
          ),
      actions: widget.actions ??
          <Widget>[
            Padding(
              padding: EdgeInsets.only(right: Insets.lg),
              child: GestureDetector(
                child: widget.icon ?? Container(),
              ),
            ),
          ],
      centerTitle: false,
    );
  }
}
