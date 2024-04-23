import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:wasl/controller/get_location_controller.dart';
import 'package:wasl/controller/school/auth/signup_controller.dart';
import 'package:wasl/core/function/validinput.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/global/custombutton.dart';

class SignUpSchoolView extends StatelessWidget {
   SignUpSchoolView ({super.key});
  final controller =Get.put(SignUpSchoolController());
  final getLocationController =Get.put(GetLocationController());

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
        title: const Text("انشاء حساب",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formState,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children:  [
            const SizedBox(height: 32,),
             CustomTextFormField(
               controller: controller.nameSchool,
              showIcon: 0,
              iconData: Icons.lock_clock_outlined,
              labelText: 'اسم المدرسة',
              hintText: 'ادخل اسم المدرسة',
              validator: (val){
                return validateInput(val: val,max: 30,min: 6);
              },
            ),
              CustomTextFormField(
                controller: controller.phone,
              showIcon: 0,
              iconData: Icons.lock_clock_outlined,
              labelText: 'رقم الموبايل',
              hintText: 'ادخل  رقم الموبايل',
              isNumber: true,
              validator: (val){
                return validateInput(val: val,max: 14,min: 9);
              },
            ),
              CustomTextFormField(
                controller: controller.userName,
              showIcon: 0,
              iconData: Icons.lock_clock_outlined,
              labelText: 'اسم المستحدم',
              hintText: 'ادخل  اسم المستحدم',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
              CustomTextFormField(
              // showIcon: 0,
                controller: controller.password,
              iconData: Icons.visibility_off,
              labelText: 'كلمة السر',
              hintText: 'ادخل  كلمة السر',
              validator: (val){
                return validateInput(val: val,max: 12,min: 4);
              },
            ),
              CustomTextFormField(
              showIcon: 0,
              controller: controller.email,
              iconData: Icons.lock_clock_outlined,
              labelText: 'الايميل',
              hintText: 'ادخل  الايميل',
              validator: (val){
                return validateInput(val: val,max: 20,min: 6);
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 12),
              child: CustomText(text: "اختار نوع الدوام"),
            ),
            Obx(
                  ()=> Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),

                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        RadioGroup<String>.builder(
                          direction: Axis.horizontal,
                          //horizontalAlignment:MainAxisAlignment.spaceAround,
                          // activeColor: GlobalData.colorCustom,
                          groupValue: controller.selectedTypeTimeId.value,
                          onChanged: (val) {
                            controller.selectedTypeTimeId.value = val.toString();
                            print("val ------------$val");
                          },
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                          items: controller.typeTime, horizontalAlignment: MainAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16,),
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
            const SizedBox(height: 16,),
            GetBuilder<SignUpSchoolController>(builder: (controller)=>HandlingDataRequest(
              statusRequest: controller.statusRequest!, widget: CustomButton(onPressed: (){
              controller.signUp();

            },text: "انشاء حساب"),)),



          ],
        ),
      ),
    );
  }
}
