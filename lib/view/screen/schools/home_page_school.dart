import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/screen/schools/profile_school.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/global.dart';
import '../../../core/constant/routes.dart';
import '../../../main.dart';
import '../../widget/global/custom_text.dart';
import '../../widget/global/custom_user_info.dart';
import '../../widget/school/custombuildcontainer.dart';
import '../../widget/school/homecard.dart';

class HomePageSchool extends StatelessWidget {
  const HomePageSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
        ),
        // القائمة الجانبية للمدرسة
        drawer: const Drawer(
          backgroundColor: AppColor.primaryColor,
          child:ProfileSchool(),
        ),
      body: ListView(children: [
        const SizedBox(height: 14,),
        CustomUserInfo(userName: sharedPreferences.getString(Global.schoolName), typeUser:sharedPreferences.getString(Global.typeUser)),
        const SizedBox(height: 16,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              // reverse: true, // التصميم يرجع من الاسفل
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 130, // الارتفاع
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 16
              ),
              children:  [
                HomeCardWidget(
                  backgroundColor: 0xffCBE2CE,
                  title: "قبول الطلبات",
                  textColor: 0xffD1F0DD,
                  onTap: (){
                    Get.toNamed(AppRoutes.approveStudentSchool);

                  },
                ),
                HomeCardWidget(
                  backgroundColor: 0xffE6CEAC,
                  title: "اضافة سائق",
                  textColor: 0xffE6CEAC,
                  onTap: (){
                    print("-------------------- j");
                    Get.toNamed(AppRoutes.addDriverView);
                  },
                ),
                HomeCardWidget(
                  backgroundColor: 0xffFFFBA4,
                  title: " الشكاوئ",
                  textColor: 0xffD1F0DD,
                  onTap: (){
                    Get.toNamed(AppRoutes.complaintSchoolView);
                  },
                ),

                HomeCardWidget(
                  backgroundColor: 0xffB7F0FF,
                  title: "اضافة اشعار جديد",
                  textColor: 0xffD1F0DD,
                  onTap: (){
                    Get.toNamed(AppRoutes.addNotificationSchool);
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16,),
        // "اسناد طالب الى سائق"
        // 0xffF6D7D5
        CustomBuildContainer(title:"اسناد طالب الى سائق",color: 0xffF6D7D5,onTap: (){
          Get.toNamed(AppRoutes.addStudentToBus);
        }),
        const SizedBox(height: 16,),
        CustomBuildContainer(title:"ادارة المنتسبين",color: 0xffCECFEE,onTap: (){

          Get.toNamed(AppRoutes.ourContactSchool);

        }),
      ],)
    );
  }
}
