import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../controller/school/add_student_to_bus.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/bus.dart';

class AddStudentToBus extends StatelessWidget {
  AddStudentToBus({super.key});

  final controller = Get.put(AddStudentToBusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 32),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView(
          children: [
            Center(child: CustomText(text: "اسناد طالب الى سائق")),
            const SizedBox(
              height: 22,
            ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomText(text: "اختار اسم السائق"),
      ),
      GetBuilder<AddStudentToBusController>(builder: (controller)=>
          HandlingDataRequest(statusRequest: controller.statusRequestBus!,
            widget:   Obx(
                  () => Container(
                    width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grey,width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<BusModel>(
                    items: controller.busData.map<DropdownMenuItem<BusModel>>((e) {
                      return DropdownMenuItem<BusModel>(
                        value: e,onTap: (){
                        controller.busId = e.buId!.toInt();
                        print("bus id  -------- ${ controller.busId}");
                      },
                        child: CustomText(text: e.drName.toString()),
                      );
                    }).toList(),
                    onChanged: (BusModel? val) {
                      controller.selectedTypeBus.value = val;
                    },
                    value: controller.selectedTypeBus.value == ""
                        ? null
                        : controller.selectedTypeBus.value,
                  ),
                ),
              ),
            ),),),

        const SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(text: "طلاب الحي المتاحين للاضافة"),
        ),


            // const SizedBox(height: 22,),
            GetBuilder<AddStudentToBusController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest!,
                      widget: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.studentDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                         return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(6),
                            padding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                GetBuilder<AddStudentToBusController>(builder: (controller)=>
                                HandlingDataRequest(statusRequest: controller.statusRequestAddStudent!, widget:
                                Container(
                                  padding: const EdgeInsets.all(6),

                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColor.grey),
                                  ),
                                  child: GestureDetector(
                                      onTap: (){
                                        controller.addStudentToBus(studentId:controller.studentDataList[index].stId!.toInt());
                                        print("student id ------ ${controller.studentDataList[index].stId!.toInt()}");
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.add),
                                          CustomText(text: "اضافة"),

                                        ],
                                      )),
                                ),
                                )
                                ),


                                Column(
                                  children: [
                                    CustomText(text: controller.studentDataList[index].stName.toString()),
                                    CustomText(text: controller.studentDataList[index].stGrader,textColor: AppColor.grey,),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColor.grey),
                                  ),
                                  child:  const Icon(Icons.person),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
