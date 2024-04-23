import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/main.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import '../../../../controller/parent/account_parent_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/global/custom_icon_appbar.dart';
class UpdateAccountParentScreen extends StatelessWidget {
  UpdateAccountParentScreen({super.key});
  final controller =Get.put(AccountParentController());
  @override
  Widget build(BuildContext context) {
    return          SafeArea(

      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 32),
          elevation: 0.0,
          title: CustomText(text: "تعديل البيانات"),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: const CustomAppBarIcon(),
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          shrinkWrap: true,
          children: [
            const SizedBox(height: 32,),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.grey),
              ),
              child: ListTile(
                leading:   Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: const Icon(Icons.person,size: 32,),
                ),
                title: CustomText(text: sharedPreferences.getString(Global.parentName.toString())??""),

              ),
            ),
            const SizedBox(height: 32,),
            CustomTextFormField(
              labelText: "اسم المستخدم",
              filled: true,
              controller: controller.userName,
            ),
            CustomTextFormField(
              labelText: "كلمة المرور",
              filled: true,
              controller: controller.password,
            ),
            CustomTextFormField(
              labelText: "البريد الالكتروني",
              filled: true,
              controller: controller.email,
            ),
            const SizedBox(height: 32,),
            GetBuilder<AccountParentController>(builder: (controller)=>
                HandlingDataRequest(statusRequest: controller.statusRequest!, widget:
                CustomButton(onPressed: (){
                  controller.checkUpdate();
                },text: "تعديل",)
                )
            ),


          ],
        ),
      ),
    );
  }
}
