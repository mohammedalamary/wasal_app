import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';

import '../../../controller/school/add_student_to_bus.dart';
import '../../../controller/school/approve_student_school_controller.dart';
import '../../../controller/school/our_contacts_school_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/custom_text.dart';
import '../../widget/global/customrowtitledata.dart';
import 'complaint_school.dart';

class OurContactSchool extends StatelessWidget {
  OurContactSchool({super.key});

  final controller = Get.put(OurContactsSchoolController());
  final controllerShowBus = Get.put(AddStudentToBusController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 32),
        elevation: 0.0,
        title: CustomText(text: "المنسوبين للمدرسة"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 4),
              child: Container(
                child: TabBar(
                  // isScrollable: true,
                  indicatorWeight: 3,
                  // indicatorSize: TabBarIndicatorSize.label,
                  controller: controller.tabController,
                  // indicatorColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  unselectedLabelColor: AppColor.black,
                  labelColor: Colors.black,
                  // labelStyle: TextStyle(fontSize: 66),unselectedLabelStyle:  TextStyle(fontSize: 66),
                  indicator: BoxDecoration(
                      color: AppColor.primaryColor,
                      // color: AppColor.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: context.theme.dividerColor,
                      )
                      // border:
                      ),
                  tabs: const [
                    Tab(
                        height: 42,
                        child: Text(
                          "الطلاب",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Tab(
                        height: 42,
                        child: Text(
                          "السائقين",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height,
              child:
                  TabBarView(controller: controller.tabController,
                      children: [
                // CustomText(text: "text"),
                // CustomText(text: "text"),
                // const CustomRowData(title: "الاسم", body: "فجر سالم البريكي"),

                    GetBuilder<OurContactsSchoolController>(builder: (controller)=>
                        HandlingDataView(statusRequest: controller.statusRequest!, widget:
                        ListView.builder(
                          itemCount: controller.studentDataList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                          return  Container(
                              margin: const EdgeInsets.all(16),
                              padding:
                              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColor.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      children:  [
                                        CustomText(text: "طلب انضمام"),

                                        CustomRowData(
                                            title: "اسم الطالب", body: controller.studentDataList[index].stName),
                                        CustomRowData(
                                            title: "الصف", body: controller.studentDataList[index].stGrader),
                                        CustomRowData(
                                            title: "رقم الحافلة", body:controller.studentDataList[index].busNumber.toString()),

                                      ],
                                    ),
                                    Positioned(
                                      top: 40,
                                      right: -38,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:  [
                                          GestureDetector(onTap: (){

                                          },child: const Icon(Icons.delete,color: AppColor.red,)),
                                          GestureDetector(onTap: (){

                                          },child: const Icon(Icons.edit)),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },),
                        )

                    ),


                GetBuilder<AddStudentToBusController>(builder: (controller)=>
                HandlingDataView(statusRequest: controllerShowBus.statusRequestBus!, widget:
                Expanded(
                  
                  child: ListView.builder(itemCount: controllerShowBus.busData.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                    return  Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(16),
                        padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  CustomRowData(
                                      title: "السائق", body: controllerShowBus.busData[index].drName??""),
                                  CustomRowData(
                                      title: "حافلة رقم", body: controllerShowBus.busData[index].busNumber.toString()??""),

                                ],
                              ),
                            ),
                            Positioned(
                              top: 16,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:  [
                                  GestureDetector(onTap: (){

                                  },child: const Icon(Icons.delete,color: AppColor.red,)),
                                  GestureDetector(onTap: (){

                                  },child: const Icon(Icons.edit)),

                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },),
                ),
                ),
                ),

                //  Container(
                //    height: 100,
                //  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
