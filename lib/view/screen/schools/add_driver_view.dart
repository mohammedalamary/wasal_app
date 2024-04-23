import 'package:flutter/material.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../../controller/get_location_controller.dart';
import '../../../controller/school/add_driver_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';

import '../../../core/function/validinput.dart';
import '../../widget/global/customlocation.dart';
class AddDriverView extends StatelessWidget {
   AddDriverView({super.key});
final controller = Get.put(AddDriverController());
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
          title: const Text("تسجيل سائق ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
          centerTitle: true,
        ),
      body: Form(
        key: controller.formState,
        child: ListView(
          children: [
            CustomTextFormField(
              filled: true,
              controller: controller.nameDriver,
              labelText: ' اسم السائق الرباعي',
              hintText: 'ادخل اسم السائق الرباعي',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            CustomTextFormField(
              filled: true,
              controller: controller.identity,
              labelText: 'رقم الهوية',
              hintText: 'ادخل  رقم الهوية',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            CustomTextFormField(
              filled: true,
              controller: controller.phone,
              labelText: 'رقم الهاتف',
              hintText: 'ادخل  رقم الهاتف',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            CustomTextFormField(
              filled: true,
              controller: controller.email,
              labelText: ' البريد الالكتروني',
              hintText: 'ادخل   البريد الالكتروني',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            CustomTextFormField(
              filled: true,
              controller: controller.userName,
              labelText: ' اسم المستخدم',
              hintText: 'ادخل اسم المستخدم',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            CustomTextFormField(
              filled: true,

              controller: controller.password,
              iconData: Icons.visibility,
              labelText: 'كلمة السر',
              hintText: 'ادخل كلمة السر',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            CustomTextFormField(
              filled: true,
              controller: controller.busNumber,
              labelText: 'رقم الحافلة',
              hintText: 'ادخل رقم الحافلة',
              validator: (val){
                return validateInput(val: val,max: 20,min: 3);
              },
            ),
            const SizedBox(height: 10,),
            CustomLocationWidget(onTap: (){
              getLocationController.getLocation();
            }),
            const SizedBox(height: 10,),
            GetBuilder<AddDriverController>(builder: (controller)=>HandlingDataRequest(
              statusRequest: controller.statusRequest!, widget: CustomButton(onPressed: (){
              controller.addDriver();

            },text: "اضافة السائق"),)),

          ],
        ),
      ),
    );
  }
}
