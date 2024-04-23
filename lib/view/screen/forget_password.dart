import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../core/constant/color.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26,
              ),
              color: AppColor.primaryColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: AppColor.greyLess
            ),
            child: CustomText(text: "سيتم ارسال كلمة السر الجديد الى البريد الالكتروني الخاص بك"),
          ),


          const SizedBox(height: 16,),
          const CustomTextFormField(labelText: "البريد الالكتروني",hintText: "ادخل البريد الالكتروني ",),
          const SizedBox(height: 16,),

          Container(
            width: double.infinity,
            child: CustomButton(onPressed: (){

            },text: "حفظ",),
          )
        ],
      ),
    );
  }
}
