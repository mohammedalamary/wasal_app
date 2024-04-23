import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../../controller/student/information_driver_student.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class DriverInformationForTheStudent extends StatelessWidget {
  const DriverInformationForTheStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(color: Colors.black, size: 32),
        title: CustomText(text: "معلومات السائق "),
        centerTitle: true,
        leading: const CustomAppBarIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          // shrinkWrap: true,
          children: [
            const SizedBox(height: 32,),

            GetBuilder<InformationDriverStudentController>(init: InformationDriverStudentController(),builder: (controller)=>
                HandlingDataView(statusRequest: controller.statusRequest!, widget:
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.busInformationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 8),
                          // margin: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColor.grey),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: controller.busInformationList[index].drName.toString()),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColor.grey),
                                ),
                                child:  const Icon(Icons.person),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12,),
                        infoDriverWidget(title:"المدرسة : ",body: controller.busInformationList[index].scName.toString()),
                        infoDriverWidget(title:"الحي : ",body: controller.busInformationList[index].neighbourhood.toString()),
                        infoDriverWidget(title:"رقم الموبايل  : ",body: controller.busInformationList[index].drPhone.toString()),
                        infoDriverWidget(title:"رقم الحافلة : ",body: controller.busInformationList[index].busNumber.toString()),

                      ],
                    );
                  },)),

            ),
            const Spacer(flex: 4),
            CustomButton(text: "ارسال شكوئ",onPressed: (){
              Get.toNamed(AppRoutes.addComplaintsStudentView);
            },),
            const Spacer(),

          ],
        ),
      ),
    );

  }
  Widget infoDriverWidget({String? title,String? body}){
   return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 32,vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      decoration: BoxDecoration(
        // color: const Color(0xffB7B9B6),
        color: Colors.grey.shade200,
        // color: AppColor.greyLess,

        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColor.black),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(text: title??""),
              const SizedBox(width: 8,),
              CustomText(text: body??""),


            ],
          )
        ],
      ),
    );
  }
}
