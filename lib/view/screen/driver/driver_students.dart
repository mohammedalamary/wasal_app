import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../controller/driver/registered_students_controller.dart';
import '../../../core/constant/color.dart';

class DriverStudent extends StatelessWidget {
  const DriverStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(color: Colors.black, size: 32),
        title: CustomText(text: "قائمة الطلاب "),
        centerTitle: true,
        leading: const CustomAppBarIcon(),
      ),
      body: Column(
        // shrinkWrap: true,
        children: [
          const SizedBox(height: 32,),
          GetBuilder<RegisteredStudentsController>(init: RegisteredStudentsController(),builder: (controller)=>
          HandlingDataView(statusRequest: controller.statusRequest!, widget:
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.driverStudentList.length,
            itemBuilder: (BuildContext context, int index) {
            return     Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(6),
              padding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.grey),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(text: "اسم الطالب"),
                              const SizedBox(width: 6,),
                              CustomText(text: controller.driverStudentList[index].stName.toString(),textColor: AppColor.grey,),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(text: "موقع الطالب"),
                              const SizedBox(width: 6,),
                              const Icon(Icons.location_on_outlined)
                            ],
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child:  const Icon(Icons.person),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },))
          ),


        ],
      ),
    );

  }
}
