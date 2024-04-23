import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../controller/parent/show_notification_parent.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class ShowNotificationParentView extends StatelessWidget {
  const ShowNotificationParentView({super.key});

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

            GetBuilder<ShowNotificationParentController>(init:ShowNotificationParentController() ,builder: (controller)=>
                HandlingDataView(statusRequest: controller.statusRequestShowNot!, widget:
                ListView.builder(physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,itemCount:  controller.notificationData.length,itemBuilder: (BuildContext context, int index) {
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
                              child: const Icon(Icons.notification_important_outlined,size: 32,color: AppColor.black,),
                            ),
                            title: CustomText(text: controller.notificationData[index].notifText.toString()??""),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(text: "اشعار من",textColor: AppColor.secondaryColor),
                                    const SizedBox(width: 12,),
                                    CustomText(text:  controller.notificationData[index].notifFrom==1?"مدرسة":
                                    "سائق",textColor: AppColor.black),
                                  ],
                                ),
                              ],
                            ),

                          ),


                        ],
                      ),
                    );
                  },),
                )
            ),
            // GetBuilder<AddNotificationSchoolController>(builder: (controlller)=>
            //     HandlingDataView(statusRequest: controller.statusRequestShowNot!, widget:
            //     ListView.builder(shrinkWrap: true,itemCount:  controller.notificationData.length,itemBuilder: (BuildContext context, int index) {
            //       return  Container(
            //         alignment: Alignment.center,
            //         margin: const EdgeInsets.all(6),
            //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            //         decoration: BoxDecoration(
            //           color: AppColor.greyLess,
            //           borderRadius: BorderRadius.circular(12),
            //           // border: Border.all(color: AppColor.grey),
            //         ),
            //         child: Column(
            //           children: [
            //
            //             ListTile(
            //               trailing:   Container(
            //                 padding: const EdgeInsets.all(12),
            //                 decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   // borderRadius: BorderRadius.circular(8),
            //                   border: Border.all(color: AppColor.greyLess),
            //                 ),
            //                 child: const Icon(Icons.person,size: 32,),
            //               ),
            //               title: CustomText(text: controller.notificationData[index].notifText.toString()??""),
            //               subtitle: Row(
            //                 children: [
            //                   CustomText(text: "اشعار الى",textColor: AppColor.red),
            //                   const SizedBox(width: 12,),
            //                   CustomText(text:  controller.notificationData[index].toNotif==1?"ولي امر ":
            //                   controller.notificationData[index].toNotif
            //                       ==2?"سائق ":"طالب     ",textColor: AppColor.black),
            //                 ],
            //               ),
            //
            //             ),
            //           ],
            //         ),
            //       );
            //     },),
            //     )
            // ),


          ],
        ),
      ),
    );
  }
}
