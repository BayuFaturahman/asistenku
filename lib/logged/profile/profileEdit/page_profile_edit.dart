import 'dart:io';

import 'package:AsistenKu/logged/profile/controller_profile.dart';
import 'package:AsistenKu/shared/constants/assets.dart';
import 'package:AsistenKu/shared/constants/constants.dart';
import 'package:AsistenKu/shared/constants/network_handeler.dart';
import 'package:AsistenKu/widget/bottomsheet/bottomsheet_menu.dart';
import 'package:AsistenKu/widget/button_primary.dart';
import 'package:AsistenKu/widget/input/inpu_primary.dart';
import 'package:AsistenKu/widget/other/show_dialog.dart';
import 'package:AsistenKu/widget/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PageEditProfile extends StatefulWidget {
  final String nama;
  final String noHp;
  final String email;

  const PageEditProfile(
      {Key? key, required this.nama, required this.noHp, required this.email})
      : super(key: key);

  @override
  State<PageEditProfile> createState() => _PageEditProfileState();
}

class _PageEditProfileState extends State<PageEditProfile> {
  final ImagePicker _picker = ImagePicker();

  var files;

  Future<File?> takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    final File? file = File(image!.path);
    files == file;
    setState(() => files = File(image.path));
    return file;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nama = TextEditingController(text: widget.nama);
    final noHp = TextEditingController(text: widget.noHp);
    final email = TextEditingController(text: widget.email);

    return PageDecorationTop(
        title: 'Edit Profile',
        iconBack: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: AppColor.bodyColor,
            )),
        child: ListView(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: ClipOval(
                          child: files != null
                              ? Image.file(
                                  files,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )
                              : Image.network(
                                  'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 90, top: 60),
                      child: InkWell(
                        onTap: () {
                          pickerEditImage(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.camera_alt,
                            size: 14,
                            color: AppColor.primaryColor,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.bodyColor.shade200),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: InputPrimary(
                  hintText: "", onChange: (val) {}, controller: nama),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: InputPrimary(
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    size: 30,
                    color: Color(0xffA6B0BD),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hintText: "No.Handphone",
                  onChange: (val) {},
                  validate: (value) {
                    if (!GetUtils.isPhoneNumber(value.toString())) {
                      return 'Masukan No.Handphone Dengan Benar';
                    }
                  },
                  controller: noHp),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: InputPrimary(
                  hintText: "Email anda",
                  controller: email,
                  onChange: (val) {},
                  validate: (value) {
                    if (!GetUtils.isEmail(value.toString())) {
                      return 'Format email belum benar';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xffA6B0BD),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
              child: ButtonPrimary(
                onPressed: () {
                  showPopUpConfirm(
                      context: context,
                      desc: 'Apakah yakin anda ingin merubah data profile',
                      functionYes: () {});
                },
                height: 60,
                radius: 15.0,
                label: 'Simpan',
                labelStyle:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  void pickerEditImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Foto"),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                  Get.back();
                  print("file" + files.toString());
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Kamera"),
                onTap: () {
                  takePhoto(ImageSource.camera);
                  Get.back();
                  print("file" + files.toString());
                },
              ),
            ],
          );
        });
  }
}
