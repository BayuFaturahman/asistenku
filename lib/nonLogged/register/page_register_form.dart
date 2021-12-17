import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/nonLogged/register/controller_register.dart';
import 'package:asistenku/shared/constants/constants.dart';
import 'package:asistenku/widget/pages/location_maps/controller_maps.dart';
import 'package:asistenku/widget/pages/location_maps/page_location.dart';
import 'package:asistenku/widget/pages/location_maps/page_location.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input/input_form.dart';
import 'package:asistenku/widget/input/input_form_icon.dart';
import 'package:asistenku/widget/input/input_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PageRegisterForm extends StatefulWidget {
  final String title;
  final int type;

  const PageRegisterForm({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  PageRegisterFormState createState() => PageRegisterFormState();
}

class PageRegisterFormState extends State<PageRegisterForm> {
  int val = -1;
  bool isChecked = false;

  DateTime selectedDate = DateTime.now();
  final ControllerMaps cMaps = Get.find<ControllerMaps>();
  final ControllerRegister cRegister = Get.find<ControllerRegister>();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.bodyColor.shade500;
    }
    return AppColor.successColor;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.png"))),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                          cMaps.originAddress('Your Location');
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Fill in your data correctly",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 17.0),
              //   child: InputForm(
              //     isPassword: false,
              //     hintText: 'Fullname',
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                child: InputFormIcon(
                  icon: Icon(Icons.person),
                  isPassword: false,
                  hintText: 'Enter your email',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                child: InputFormIcon(
                  icon: Icon(Icons.lock_rounded),
                  isPassword: true,
                  hintText: 'Password',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                child: InputFormIcon(
                  icon: Icon(Icons.lock_rounded),
                  isPassword: true,
                  hintText: 'Confirm Password',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0),
                child: InputFormIcon(
                  icon: Icon(Icons.phone_android_sharp),
                  isPassword: true,
                  hintText: 'No. Handphone',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 3,
                      child: ListTile(
                        title: const Text(
                          "Male",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value as int;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2.5,
                      child: ListTile(
                        title: const Text(
                          "Female",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value as int;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Place, and date of birth"),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                    height: 44,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.grey),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            DateFormat.d().format(selectedDate).toString() +
                                ' ' +
                                DateFormat.MMM()
                                    .format(selectedDate)
                                    .toString() +
                                ',' +
                                ' ' +
                                DateFormat.y().format(selectedDate).toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const PageLocation()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                    height: 44,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.grey),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  cMaps.originAddress.value,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              widget.type == 2
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: ListTile(
                          title: const Text(
                            "Are you from an institution/foundation ?",
                            style: TextStyle(fontSize: 14),
                          ),
                          leading: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                                print("val :" + isChecked.toString());
                                if (isChecked == true) {
                                  cRegister.insitution(true);
                                }
                                if (isChecked == false) {
                                  cRegister.insitution(false);
                                }
                              });
                            },
                          )),
                    )
                  : verticalSpace(0),
              // Obx(() => cRegister.insitution.value == true
              //     ? const Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 17.0),
              //         child: InputForm(
              //           isPassword: false,
              //           hintText: 'Name your Foundation',
              //         ),
              //       )
              //     : verticalSpace(0)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                child: ButtonPrimary(
                  onPressed: () => Get.offAll(() => PageOnboarding()),
                  height: 60,
                  radius: 15.0,
                  label: 'Next',
                  labelStyle: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
