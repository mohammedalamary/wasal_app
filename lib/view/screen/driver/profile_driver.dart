import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/main.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/driver/profile_driver.dart';
import '../../widget/school/widgetprofile.dart';
class ProfileDriverView extends StatelessWidget {
  ProfileDriverView({super.key});
  final controller =Get.put(ProfileDriverController());

  @override
  Widget build(BuildContext context) {
    return          SafeArea(

      child: Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32,),
            Align(
                alignment: Alignment.center,
                child: CustomText(text: "الحساب",fontSize: 16,)),
            const SizedBox(height: 32,),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xffDFD1C5),
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
                title: CustomText(text: sharedPreferences.getString(Global.driverName.toString())??""),
                subtitle: CustomText(text: sharedPreferences.getString(Global.driverEmail.toString())??"",textColor: AppColor.grey),

              ),
            ),
            const SizedBox(height: 32,),
            CustomProfileWidget(title: "نوع المستحدم     ${sharedPreferences.getString(Global.typeUser)}"
                ,icon: Icons.person_outline_outlined,onTap: (){
                  // Get.to(UpdateProfileSchool());
                }),
            // const SizedBox(height: 32,),

            CustomProfileWidget(title: "تعديل البسانات",icon: Icons.edit,onTap: (){
              Get.toNamed(AppRoutes.updateAccountDriverScreen);
            }),
            CustomProfileWidget(title: "الاعدادات",icon: Icons.settings,onTap: (){
              // Get.to(SettingParentView());
            }),
            CustomProfileWidget(title: "الشروط ولاحكام",icon: Icons.interpreter_mode_sharp,onTap: (){
              // Get.to(UpdateProfileSchool());
            }),
            const SizedBox(height: 32,),

            CustomProfileWidget(title: "تيجيل الخروج",icon: Icons.exit_to_app,onTap: (){
              //  مسج كل البيانات المخزنة في الهاتف
              controller.exitApp();
            },)
          ],
        ),
      ),
    );
  }
}
