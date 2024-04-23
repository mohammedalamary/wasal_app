import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/main.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import '../../../controller/student/attendance_student_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/custombutton.dart';
class AttendanceStudentView extends StatelessWidget {
  AttendanceStudentView({super.key});
  final controller = Get.put(AAttendanceStudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading:const CustomAppBarIcon(),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            // alignment: Alignment.,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration:  const BoxDecoration(
              color: Color(0xffE5E4E9),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text:"ملاحظة",textColor: AppColor.red,fontSize: 14),
                CustomText(text: "علما بان موعد الحضور هو 6:30 وموعد الخروج هو 12:30 "),
              ],
            ),),

          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 6),
            child: CustomText(text: "هل ستم حضور الطالب......"),
          ),
          Container(

            alignment: Alignment.topRight,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.grey),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(text: "اسم الطالب "),
                    const SizedBox(width: 6,),
                    CustomText(text: sharedPreferences.getString(Global.studentName),textColor: AppColor.grey),
                  ],
                ),

                // const SizedBox(height: 12,),

                GetBuilder<AAttendanceStudentController>(builder: (controller)=>
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.options.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(controller.options[index]),
                          value: index,
                          groupValue: controller.selectedOption,
                          onChanged: ( value) {
                            controller.updateSelectedOption(value!);
                            controller.preparationType =controller.options[index]=="سيحضر"?1:0;
                            print("preparation Type -------- ${controller.preparationType}");

                          },
                        );
                      },
                    ),
                ),
              ],
            ),
          ),





          GetBuilder<AAttendanceStudentController>(builder: (controller)=>
              HandlingDataRequest(statusRequest: controller.statusRequest!, widget:
              CustomButton(text: "ارسال",onPressed: (){
                controller.attendanceStudent();
              }),
              )
          ),

        ],
      ),
    );
  }
}
