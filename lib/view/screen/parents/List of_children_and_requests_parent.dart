import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import '../../../controller/parent/join_student_parent_controller.dart';
import '../../../controller/parent/list_of_children_and_requests_parentView.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/parent_student.dart';
import '../../widget/global/customadd_account_children.dart';
import '../../widget/global/customrowtitledata.dart';

class ListOfChildrenAndRequestsParentView extends StatelessWidget {
  ListOfChildrenAndRequestsParentView({super.key});
  final controller = Get.put(ListOfChildrenAndRequestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading:const CustomAppBarIcon(),
        title: CustomText(text: "قائمة الايناء والطلبات"),
      ),
      body: Column(
        // shrinkWrap: true,
        children: [

          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomText(text: "قائمة الابناء ",fontSize: 14,),

              ],
            ),
          ),

          const SizedBox(height: 6,),

          Flexible(
            flex: 4,
            child: GetBuilder<ListOfChildrenAndRequestsController>(builder: (controller)=>
                HandlingDataView(statusRequest: controller.statusRequest!, widget:
                ListView.builder(
                  itemCount: controller.parentStudentList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    ParentStudent  per =controller.parentStudentList[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Column(
                            children:  [

                              CustomRowData(
                                  title: "اسم الطالب", body: controller.parentStudentList[index].stName),
                              CustomRowData(
                                  title: "المرحلة", body: controller.parentStudentList[index].stLevel),
                              CustomRowData(
                                  title: " الصف", body:controller.parentStudentList[index].grader.toString()),

                            ],
                          ),
                        ),
                      );
                  },),
                )
            ),
          ),
          const SizedBox(height: 12,),
           CustomAddAccountChildren(title:  "طلب انظمام",onTap: (){
            Get.toNamed(AppRoutes.joinStudentParentView);
          },),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "قائمة الطلبات ",fontSize: 14,),
              ],
            ),
          ),
          const SizedBox(height: 6,),
          Flexible(
            flex: 3,
            child: GetBuilder<ListOfChildrenAndRequestsController>(builder: (controller)=>
                HandlingDataView(statusRequest: controller.statusRequestNoActive!, widget:
                ListView.builder(
                  itemCount: controller.parentStudentListNoActive.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    ParentStudent  per =controller.parentStudentList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Column(
                          children:  [

                            CustomRowData(
                                title: "اسم الطالب", body: controller.parentStudentListNoActive[index].stName),
                            CustomRowData(
                                title: "المرحلة", body: controller.parentStudentListNoActive[index].stLevel),
                            CustomRowData(
                                title: " الصف", body:controller.parentStudentListNoActive[index].grader.toString()),
                          ],
                        ),
                      ),
                    );
                  },),
                )
            ),
          ),
        ],
      ),
    );
  }
}
