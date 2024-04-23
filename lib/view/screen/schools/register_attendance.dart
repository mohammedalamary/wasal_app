import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../../controller/school/register_attendance_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/school/customtimecolockwidget.dart';

class RegisterAttendance extends StatelessWidget {
   RegisterAttendance({super.key});
final controller = Get.put(RegisterAttendanceController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(


        leading:   Container(
          margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 26,),color: AppColor.primaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title:  CustomText(text: "تسجيل مواعيد الحضور"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 32,),

          Padding(
            padding: const EdgeInsets.only(right: 32.0,bottom: 6),
            child: CustomText(text: "اختار نوع الدوام"),
          ),
          Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey,width: 1),
                    borderRadius: BorderRadius.circular(12),
                    ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
              items: controller.typePermanence.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
              }).toList(),
              onChanged: (val) {
                    controller.upDateSelected(val.toString());
              },
              value: controller.selectedTypePermanence.value == ""
                      ? null
                      : controller.selectedTypePermanence.value,
            ),
                  ),
                ),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0,vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "موعد الحضور"),
                Obx(() => GestureDetector(
                    onTap: (){
                      controller.chooseTime(typeHour: 1);
                      controller.fromHour="${controller.presenceTime.value.hour.toString()}:${controller.presenceTime.value.minute.toString()}:0.0";
                      print("-----startHour------ ${controller.fromHour}");

                      },
                    child: Container(
                      padding: const EdgeInsets.all(8),

                        decoration: BoxDecoration(
                          color: Colors.grey.shade300
                        ),
                        child: CustomText(text: "${controller.presenceTime.value.minute.toString()} : ${controller.presenceTime.value.hour.toString()}")))),
              ],

            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0,vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "موعد الانصراف"),
                Obx(() => GestureDetector(
                    onTap: (){
                      controller.chooseTime();
                      controller.toHour="${controller.departureTime.value.hour.toString()}:${controller.departureTime.value.minute.toString()}:0.0";
                      print("-----to hour ------ ${controller.toHour}");
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),

                        decoration: BoxDecoration(
                            color: Colors.grey.shade300
                        ),
                        child: CustomText(text: "${controller.departureTime.value.minute.toString()} : ${controller.departureTime.value.hour.toString()}")))),
              ],

            ),
          ),

          const SizedBox(height: 32,),


          GetBuilder<RegisterAttendanceController>(builder: (controller)=>HandlingDataRequest(
            statusRequest: controller.statusRequest!, widget: CustomButton(onPressed: (){
            controller.addAttendance();

          },text: "حفظ"),)),
        ],
      ),
    );
  }
}
