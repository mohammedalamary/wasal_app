import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../main.dart';

class ProfileParent extends StatelessWidget {
  const ProfileParent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        const SizedBox(height: 62,),

        buildDrawarTitle(title:"طلب الانظمام ",onTap: (){
          Get.back();
          Get.toNamed(AppRoutes.joinStudentParentView);
        }),


        buildDrawarTitle(title:"اضافة حساب للابناء",onTap: (){
          Get.back();
          Get.toNamed(AppRoutes.addAccountForChildrenParent);
        }),
        buildDrawarTitle(title:"الشكاوئ",onTap: (){
          Get.back();
          Get.toNamed(AppRoutes.showComplaintsParentView);

        }),
        buildDrawarTitle(title:"قائمة الابناء والطلبات",onTap: (){
          Get.back();

          Get.toNamed(AppRoutes.listOfPotsAndOrdersParentView);

        }),
        // buildDrawarTitle(title:"اسناد طالب الى سائق",onTap: (){
        //   Get.toNamed(AppRoutes.addStudentToBus);
        //
        // }),
        // buildDrawarTitle(title:"ادارة المنتسبين" ,onTap: (){
        //   Get.toNamed(AppRoutes.ourContactSchool);
        // }),
        buildDrawarTitle(title:"الحساب" ,onTap: (){
          Get.back();
          Get.toNamed(AppRoutes.updateAccountParentScreen);
        }),
        const SizedBox(height: 16,),
        GestureDetector(
            onTap: (){
              sharedPreferences.clear();
              Get.offAndToNamed(AppRoutes.login);
            },
            child: const Center(child: Text("تسجيل خروج",style: TextStyle
              (fontWeight: FontWeight.bold,fontSize: 16,color: AppColor.black),))),
      ],
    );
  }
  Widget buildDrawarTitle({String? title,void Function()? onTap}){
    return   GestureDetector(
      onTap:onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title??"",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          const Divider(endIndent: 12,thickness: 1,color: Colors.black,)
        ],
      ),
    );
  }
}
