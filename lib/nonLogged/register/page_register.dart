import 'package:asistenku/nonLogged/onboardingSplash/page_onboarding.dart';
import 'package:asistenku/nonLogged/register/page_register_form.dart';
import 'package:asistenku/widget/button_primary.dart';
import 'package:asistenku/widget/input_form_icon.dart';
import 'package:asistenku/widget/input_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRegister extends StatefulWidget {
  @override
  PageRegisterState createState() => PageRegisterState();
}

class PageRegisterState extends State<PageRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
         decoration:const  BoxDecoration(
           image: DecorationImage(
               fit: BoxFit.cover,
             image: AssetImage("assets/images/background.png")
           )
         ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children:  [
                    InkWell(
                      onTap: ()=>Get.back(),
                        child: const Icon(Icons.arrow_back_ios,size: 25,color: Colors.grey,))
                  ],
                ),
              ),

              SizedBox(
                height: Get.height / 4,
                width: Get.width / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/hands.png',
                      height: 37,
                      width: 37,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Register yourself as ?",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Get.to(()=>const PageRegisterForm(title: 'Member',type: 1,)),
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image:const  DecorationImage(
                        image: AssetImage('assets/images/bg_card.png'),
                        fit: BoxFit.cover
                      )
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_user.png",width: 35,height: 35,),
                          const SizedBox(width:20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                              Text("Member",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("Lorem ipsum dolor",style: TextStyle(fontSize: 12),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Get.to(()=>const PageRegisterForm(title: 'Worker',type: 2,)),
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image:const  DecorationImage(
                            image: AssetImage('assets/images/bg_card.png'),
                            fit: BoxFit.cover
                        )
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_worker.png",width: 35,height: 35,),
                          const SizedBox(width:20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                              Text("Worker",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("Lorem ipsum dolor",style: TextStyle(fontSize: 12),)

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
