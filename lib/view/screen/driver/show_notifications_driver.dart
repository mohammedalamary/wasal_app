import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import '../../../controller/driver/notification_driver.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/global/custom_icon_appbar.dart';
import '../../widget/global/customadd_account_children.dart';
class ShowNotificationDriver extends StatelessWidget {
  ShowNotificationDriver({super.key});
  final controller = Get.put(NotificationDriverController());

  @override
  Widget build(BuildContext context) {
    return          SafeArea(

      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          // iconTheme: const IconThemeData(color: Colors.black, size: 32),
          title: CustomText(text: "الاشعارات ",fontSize: 18),
          centerTitle: true,
          leading: const CustomAppBarIcon(),
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [

            const SizedBox(height: 32,),
            CustomAddAccountChildren(title:  "اضافة اشعار",onTap: (){
              Get.toNamed(AppRoutes.addNotificationDriver);
            },),

            const SizedBox(height: 32,),

            GetBuilder<NotificationDriverController>(builder: (controller)=>
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
                              Row(
                                children: [
                                  CustomText(text: "اشعار الى",textColor: AppColor.red),
                                  const SizedBox(width: 12,),
                                  CustomText(text:  controller.notificationData[index].toNotif==1?"ولي امر ":
                                  controller.notificationData[index].toNotif
                                      ==2?"سائق ": controller.notificationData[index].toNotif
                                      ==3?"طالب ":"الكل",textColor: AppColor.black),
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


          ],
        ),
      ),
    );
  }
}
