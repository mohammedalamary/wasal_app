import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../controller/school/add_notification_school_controller.dart';
import '../../../core/constant/color.dart';
class ShowNotificationSchool extends StatelessWidget {
  ShowNotificationSchool({super.key});
  final controller = Get.put(AddNotificationSchoolController());
  @override
  Widget build(BuildContext context) {
    return          SafeArea(

      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),

          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32,),
            Align(
                alignment: Alignment.center,
                child: CustomText(text: "الاشعارات",fontSize: 16,)),
            const SizedBox(height: 32,),
            GetBuilder<AddNotificationSchoolController>(builder: (controlller)=>
            HandlingDataView(
              statusRequest: controller.statusRequestShowNot!, widget:
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount:  controller.notificationData.length,
              itemBuilder: (BuildContext context, int index) {
            return  Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColor.greyLess,
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: AppColor.grey),
                ),
                child: Column(
                  children: [

                    ListTile(
                      trailing:   Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.greyLess),
                        ),
                        child: const Icon(Icons.notification_important_outlined,size: 32,),
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: controller.notificationData[index].notifText.toString()??""),
                          Row(
                            children: [
                              CustomText(text: "اشعار من",textColor: AppColor.red),
                              const SizedBox(width: 12,),
                              CustomText(text:  controller.notificationData[index].notifFrom==1?"المدرسة":"سائق",),
                            ],
                          ),


                        ],
                      ),
                      subtitle: Row(
                        children: [
                          CustomText(text: "اشعار الى",textColor: AppColor.red),
                          const SizedBox(width: 12,),
                          CustomText(text:  controller.notificationData[index].toNotif==1?"ولي امر ":
                          controller.notificationData[index].toNotif
                              ==2?"سائق ":controller.notificationData[index].toNotif==3?"طالب ":"الى الكل",textColor: AppColor.black),
                        ],
                      ),

                    ),
                  ],
                ),
              );
            },),
            )
            ),


          ],
        ),
      ),
    );
  }
}
