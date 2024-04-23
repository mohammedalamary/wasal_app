import 'package:wasl/core/constant/color.dart';
import 'package:wasl/core/constant/imagesasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import '../../../controller/school/success_signup_controller.dart';
class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpController controller = Get.put(SuccessSignUpController());
    return Scaffold(
      appBar: AppBar(
        title:CustomText(text: "تم انشاء الحساب بنجاح",),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.greyLess,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          children: [
            Image.asset(AppImageAsset.successSignUp,),
            const SizedBox(height: 16,),
             CustomText(text: "تم انشاء الحساب بنجاح"),


            const Spacer(flex: 5,),
            CustomButton(text: "الدهاب الى تسجيل الدخول",onPressed: (){
              controller.goToLogin();

            },),


            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
