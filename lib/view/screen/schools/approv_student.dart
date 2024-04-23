import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/global/custom_radio.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../../controller/school/approve_student_school_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/customrowtitledata.dart';

class ApproveStudentSchool extends StatelessWidget {
   ApproveStudentSchool({super.key});
final controller = Get.put(ApproveStudentSchoolController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 32
        ),
        elevation: 0.0,
        title: CustomText(text: "قبول طلبات الطلاب"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 32,),

          GetBuilder<ApproveStudentSchoolController>(builder: (controller)=>
          HandlingDataView(statusRequest: controller.statusRequest!, widget:
          ListView.builder(itemCount:controller.studentDataList.length ,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.grey),
              ),
              child: Column(
                // shrinkWrap: true,
                children: [
                  CustomText(text: "طلب انضمام"),
                  const Divider(color: AppColor.grey,thickness: 1,endIndent: 30,indent: 30),
                   CustomRowData(title: "الاسم",body:controller.studentDataList[index].stName.toString()??""),
                   CustomRowData(title: "رقم الهوية",body: controller.studentDataList[index].stIdentity.toString()),
                   CustomRowData(title: "موقع الطالب",body: controller.studentDataList[index].stLatitude.toString()),
                   CustomRowData(title: "هل لدى الطال ضمان ",body:
                   controller.studentDataList[index].stGuarantee==0?"لا":"نعم"),
                  // Obx(()=>CheckboxListTile(
                  //     title: const Text('GeeksforGeeks'),
                  //     subtitle: const Text('A computer science portal for geeks.'),
                  //     secondary: const Icon(Icons.code),
                  //     autofocus: false,
                  //     activeColor: Colors.green,
                  //     checkColor: Colors.white,
                  //     // selected: _value,
                  //     value:  controller.isCheckedList[index],
                  //     onChanged: (bool? value) {
                  //       // setState(() {
                  //        controller.isCheckedList.value = List.generate(
                  //            controller.isCheckedList.length,
                  //                (i) => i == index ? value! : false);
                  //       // });
                  //     },
                  //   ),
                  // ), //Ch

                  Padding(
                    padding: const EdgeInsets.only(right: 32.0,top: 32),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Obx(()=>
                                Checkbox(value:
                                controller.isCheckedListActive[index],
                                // controller.isChecked[index],
                                  onChanged: (bool? value) {
                                    // controller.checkActivateStudent.value =value!;
                                    controller.changeActiveStudent(val: value,type: 1);
                                    // controller.isChecked[index] = value!;
                                    controller.isCheckedListActive.value = List.generate(
                                        controller.isCheckedListActive.length,
                                            (i) => i == index ? value! : false);
                                    controller.isCheckedListReject[index] = false;
                                    // controller.isCheckedListReject = false.obs as RxList<bool>;

                                    // });
                                  },
                                  activeColor: AppColor.primaryColor ,
                                  checkColor: AppColor.red
                                  ,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                            ),
                            CustomText(text: 'قبول الطلب'),

                          ],
                        ),
                        Row(
                          children: [
                            Obx(()=>
                                Checkbox(
                                  value:controller.isCheckedListReject[index],
                                  onChanged: (bool? value) {
                                    // controller.noActivateStudent.value =value!;
                                    controller.changeActiveStudent(val: value,type: 2);
                                    controller.isCheckedListReject.value = List.generate(
                                        controller.isCheckedListReject.length,
                                            (i) => i == index ? value! : false);
                                    controller.isCheckedListActive[index]=false;

                                  },
                                  activeColor: AppColor.primaryColor ,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                            ),
                            CustomText(text: ' رفض الطلب'),

                          ],
                        ),

                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 32.0, top: 32),
                  //   child: Row(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Obx(() => CustomRadio<bool>(
                  //             value: true,
                  //             groupValue: controller.checkActivateStudent.value == index,
                  //             onChanged: (bool? value) {
                  //               if (value != null && value) {
                  //                 controller.changeActiveStudent(val: index, type: 1);
                  //               }
                  //             },
                  //             activeColor: Colors.green, // Customize the color here
                  //           )),
                  //           CustomText(text: 'قبول الطلب'),
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           Obx(() => CustomRadio<bool>(
                  //             value: true,
                  //             groupValue: controller.noActivateStudent.value == index,
                  //             onChanged: (bool? value) {
                  //               if (value != null && value) {
                  //                 controller.changeActiveStudent(val: index, type: 2);
                  //               }
                  //             },
                  //             activeColor: Colors.red, // Customize the color here
                  //           )),
                  //           CustomText(text: 'رفض الطلب'),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  GetBuilder<ApproveStudentSchoolController>(builder: (controller)=>

                  HandlingDataRequest(statusRequest: controller.statusRequestApprove!, widget:
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomButton(text: "حفظ",onPressed: (){
                      controller.checkApprove(studentId: controller.studentDataList[index].stId);
                    }),
                  ),
                  )

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
