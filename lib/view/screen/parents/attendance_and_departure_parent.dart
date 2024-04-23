import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../../controller/parent/attendance_departure_controller.dart';
import '../../../core/constant/color.dart';
class AttendanceAndDepartureParent extends StatelessWidget {
   AttendanceAndDepartureParent({super.key});
final controller = Get.put(AAttendanceDepartureParentController());
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
          Align(
            alignment: Alignment.center,
              child: CustomText(text: "هل ستم حضور الطالب......")),


          GetBuilder<AAttendanceDepartureParentController>(builder: (controller)=>
          HandlingDataView(statusRequest: controller.statusRequest!, widget:
          Container(
            height: 200,
            alignment: Alignment.center,

            // margin: const EdgeInsets.all(16),
            // padding:
            // const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(8),
            //   border: Border.all(color: AppColor.grey),
            // ),

            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index){
                controller.onPageChanged(index);
                print("index : $index");
              },
              itemCount: controller.studentDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "الطالب "),
                              const SizedBox(width: 6,),
                              CustomText(text: controller.studentDataList[index].stName),
                            ],
                          ),

                          ListTile(
                            // contentPadding: EdgeInsets.all(1),
                            leading:Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColor.greyLess),
                              ),
                              child: const Icon(Icons.person,size: 32,),
                            ),

                            subtitle:  Obx(() => ListTile(
                              title: const Text("لن يحضر"),
                              leading: Radio(
                                value: index,
                                groupValue: controller.selectedIndexAbsent.value,
                                onChanged: (val) {
                                  controller.studentId = controller.studentDataList[index].stId!.toInt();
                                  controller.setSelectedIndex(index,0);
                                  print("student id ------ ${controller.studentId}");
                                }
                                ,
                              ),
                            ),),
                            title:  Obx(() => ListTile(
                              title: const Text("سيتم الحضور"),
                              leading: Radio(
                                value: index,
                                  groupValue: controller.selectedIndexPresent.value,
                                  onChanged: (val) {
                                    controller.studentId = controller.studentDataList[index].stId!.toInt();
                                    controller.setSelectedIndex(index,1);
                                    print("student id ------ ${controller.studentId}");

                                  }
                                ,
                              ),
                            ),),
                          ),
                          //
                          // )
                        ],
                      ),
                      const Positioned(
                          left: -12,
                          top: 60,
                          child: Icon(Icons.arrow_forward_outlined,size: 32,)),
                    ],
                  ),
                );
              },),
          ),
          )
          ),

          GetBuilder<AAttendanceDepartureParentController>(builder: (controller)=>
          HandlingDataRequest(statusRequest: controller.statusRequestPre!, widget:
          CustomButton(text: "ارسال",onPressed: (){
            controller.preparationStudentData();
          }),
          )
          ),

        ],
      ),
    );
  }
}
