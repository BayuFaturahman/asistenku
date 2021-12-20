import 'dart:developer';

import 'package:AsistenKu/shared/constants/colors.dart';
import 'package:AsistenKu/shared/constants/phone_country_code.dart';
import 'package:AsistenKu/shared/constants/styles.dart';
import 'package:AsistenKu/widget/input/input_serach.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPhone extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final ValueSetter<String> phoneNumber;
  final Function(String?)? onSave;
  final Function()? onEditingComplete;
  const InputPhone({
    this.hintText = '',
    this.validate,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    required this.phoneNumber,
    this.onSave,
    this.onEditingComplete,
  });

  @override
  _InputPhoneState createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  String _flag = "🇮🇩";
  String _countryCode = '+62';
  List _filterList = [];
  TextEditingController _keyword = TextEditingController();

  @override
  void initState() {
    widget.phoneNumber('62');
    super.initState();
  }

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
                    style: TextStyles.body1,
                  ),
                )
              : verticalSpace(0),
          TextFormField(
            enableInteractiveSelection: true,
            cursorColor: AppColor.primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange ??
                (value) {
                  widget.phoneNumber(_countryCode + value);
                },
            onEditingComplete: widget.onEditingComplete,
            onSaved: widget.onSave,
            keyboardType: TextInputType.phone,
            controller: widget.controller,
            validator: (value) {
              if (!GetUtils.isPhoneNumber(_countryCode + value.toString())) {
                return 'Masukkan nomor Telepon dengan benar';
              }
              return null;
            },
            style: TextStyles.body1,
            inputFormatters: [LengthLimitingTextInputFormatter(13)],
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
                prefixIcon: InkWell(
                  onTap: _showListCountry,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Insets.med),
                    child: Row(
                      children: [
                        Text(_flag),
                        horizontalSpace(Insets.xs),
                        Text(_countryCode)
                      ],
                    ),
                  ),
                ),
                prefixIconConstraints:
                    BoxConstraints(maxWidth: Insets.xxl * 2.5),
                suffixIcon: widget.suffixIcon,
                hintStyle: TextStyles.body1
                    .copyWith(color: AppColor.bodyColor.shade500)),
          ),
        ],
      ),
    );
  }

  void onTap({required int index, required List list}) {
    setState(() {
      _flag = list[index]['flag'].toString();
      _countryCode = list[index]['dial_code'].toString();
    });
    widget.phoneNumber(_countryCode + widget.controller.text);
    Get.back();
  }

  void _showListCountry() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: Corners.lgBorder, color: Colors.white),
            padding: EdgeInsets.symmetric(horizontal: Insets.lg),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return DraggableScrollableSheet(
                initialChildSize: 0.9,
                builder: (context, scrollController) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text('Pilih Negara',
                                style: TextStyles.subtitle1)),
                        IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    InputSearch(
                        controller: _keyword,
                        onChanged: (value) {
                          setState(() {
                            _filterList = _buildSearchList(
                                userSearchTerm: value.toString());
                          });
                        }),
                    Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: _filterList.length == 0
                              ? PhoneCountryCode.listCountry.length
                              : _filterList.length,
                          itemBuilder: (context, index) {
                            return _filterList.length == 0
                                ? _showBottomSheetWithSearch(
                                    index: index,
                                    list: PhoneCountryCode.listCountry)
                                : _showBottomSheetWithSearch(
                                    index: index, list: _filterList);
                          }),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  Widget _showBottomSheetWithSearch({required int index, required List list}) {
    return InkWell(
      onTap: () => onTap(index: index, list: list),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Insets.med),
        child: Row(
          children: [
            Text(list[index]['flag'].toString()),
            horizontalSpace(Insets.xs),
            SizedBox(
              child: Text(list[index]['dial_code'].toString()),
              width: Insets.xl * 3,
            ),
            horizontalSpace(Insets.sm),
            Expanded(
              child: Text(
                list[index]['name'].toString(),
                maxLines: 2,
                style: TextStyles.body2,
              ),
            )
          ],
        ),
      ),
    );
  }

  List _buildSearchList({required String userSearchTerm}) {
    List _searchList = [];

    for (int i = 0; i < PhoneCountryCode.listCountry.length; i++) {
      String name =
          PhoneCountryCode.listCountry[i]['name'].toString().toLowerCase();
      if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
        _searchList.add(PhoneCountryCode.listCountry[i]);
      }
    }
    return _searchList;
  }
}
