import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/core/function/validinput.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import '../../../controller/get_location_controller.dart';
import '../../../controller/parent/add_account_for_children_parent_controller.dart';
import '../../../controller/parent/join_student_parent_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/customadd_account_children.dart';
class AddAccountForChildrenParent extends StatelessWidget {
  AddAccountForChildrenParent({super.key});
  final controller = Get.put(AddAccountForChildrenParentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const CustomAppBarIcon(),
        title: CustomText(text: "اضافة حساب للابناء"),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formState,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16,),
            CustomAddAccountChildren(title:  "طلب انظمام",onTap: (){
              Get.toNamed(AppRoutes.joinStudentParentView);
            },),            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(text: "اختار اسم الابن"),
            ),
            GetBuilder<AddAccountForChildrenParentController>(builder: (controller)=>
                HandlingDataRequest(statusRequest: controller.statusRequest!,
                  widget:   Obx(
                        () => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.grey,width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          items: controller.studentDataList.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e.stName,onTap: (){
                              controller.studentId = e.stId!.toInt();
                              print("student id  -------- ${ controller.studentId}");
                            },
                              child: CustomText(text: e.stName.toString()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            controller.upDateSelected(val.toString());

                          },
                          value: controller.selectedTypeStudent.value == ""
                              ? null
                              : controller.selectedTypeStudent.value,
                        ),
                      ),
                    ),
                  ),),

            ),
            const SizedBox(height: 16,),
            CustomTextFormField(
              labelText: "اسم المستخدم ",
              hintText: "ادخل اسم المستخدم ",
              controller: controller.userName,
              filled: true,
              validator: (val){
                return validateInput(val:val,min: 4,max: 30);
              },
            ),

            CustomTextFormField(
              labelText: "كلمة المرور",
              filled: true,

              hintText: "ادخل كلمة المرور",
              controller: controller.userPassword,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,min: 4,max: 12);
              },
            ),
            CustomTextFormField(
              labelText: "البريد الالكتروني",
              hintText: "ادخل البريد الالكتروني",
              filled: true,

              controller: controller.email,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,min: 10,max: 22);
              },
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'هل يسمح للطالب بالتحصير ? '),

                  Obx(()=>
                      Checkbox(value:controller.checkActivateAttendees.value,
                        onChanged: (bool? value) {
                          controller.checkActivateAttendees.value =value!;

                        },
                        activeColor: AppColor.primaryColor ,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 12,),

            GetBuilder<AddAccountForChildrenParentController>(builder: (controller)=>
                HandlingDataRequest(statusRequest: controller.statusRequestAddStudent!, widget:
                CustomButton(text: "حفظ",onPressed: (){
                  controller.addStudent();
                }),
                ),

            ),

          ],
        ),
      ),
    );
  }
}
