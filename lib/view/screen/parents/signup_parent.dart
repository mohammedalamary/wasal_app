import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/core/function/validinput.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import '../../../controller/get_location_controller.dart';
import '../../../controller/parent/join_student_parent_controller.dart';
import '../../../controller/parent/signup_parent_controller.dart';
import '../../../core/constant/color.dart';
class SignUpParentView extends StatelessWidget {
  SignUpParentView({super.key});
  final controller = Get.put(SignUpParentController());
  final getLocationController =Get.put(GetLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26,
              ),
              color: AppColor.primaryColor),
        ),
        title: CustomText(text: "انشاء حساب"),
      ),
      body: Form(
        key: controller.formState,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16,),
            CustomTextFormField(
              labelText: "الاسم الرباعي",
              hintText: "ادخل الاسم الرباعي",
              controller: controller.nameParent,
              validator: (val){
                return validateInput(val:val,min: 10,max: 30);
              },
            ),
            CustomTextFormField(
              labelText: "رقم الهوية",
              hintText: "ادخل رقم الهوية",
              controller: controller.parentIdentity,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,max: 12,min: 10);
              },
            ),
            CustomTextFormField(
              labelText: "رقم الهاتف",
              hintText: "ادخل رقم الهاتف",
              controller: controller.phone,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,min: 10,max: 12);
              },
            ),

            CustomTextFormField(
              labelText: "الايميل",
              hintText: "ادخل الايميل",
              controller: controller.email,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,max: 20,min: 6);
              },
            ),
            CustomTextFormField(
              labelText: "اسم المستخدم",
              hintText: "ادخلاسم المستخدم",
              controller: controller.userName,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,max: 12,min: 4);
              },
            ),
            CustomTextFormField(
              labelText: "كلمة المرور",
              hintText: "ادخل كلمة المرور",
              controller: controller.password,
              isNumber: true,

              validator: (val){
                return validateInput(val:val,max: 12,min: 4);
              },
            ),

            GestureDetector(
              onTap: (){
                getLocationController.getLocation();
              },
              child: Container(
                // height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.grey,width: 1,)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "اضافة الموقع"),
                    const Icon(Icons.location_on_outlined)
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(text: "اختار اسم المدرسة"),
            ),
            GetBuilder<SignUpParentController>(builder: (controller)=>
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
                          items: controller.schoolData.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e.scName,onTap: (){
                              controller.schoolId = e.scId!.toInt();
                              print("school id  -------- ${ controller.schoolId}");
                            },
                              child: CustomText(text: e.scName.toString()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            controller.upDateSelected(val.toString());

                          },
                          value: controller.selectedTypeSchool.value == ""
                              ? null
                              : controller.selectedTypeSchool.value,
                        ),
                      ),
                    ),
                  ),),

            ),
            const SizedBox(height: 12,),

            GetBuilder<SignUpParentController>(builder: (controller)=>
                HandlingDataRequest(statusRequest: controller.statusRequestSignUp!, widget:
                CustomButton(text: "ارسال",onPressed: (){
                  controller.signUp();
                }),
                ),

            ),

          ],
        ),
      ),
    );
  }
}
