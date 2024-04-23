import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/main.dart';
import '../../../core/class/stausrequest.dart';
import '../../../core/function/custom_dilaog.dart';
import '../../../core/function/handlingdatacontroller.dart';
import '../../../data/datasource/remote/school/signup.dart';

class SignUpSchoolController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
late TextEditingController nameSchool,phone,userName,password,email  ;
  RxDouble latitude  = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  SignUpSchoolData  signUpSchoolData = SignUpSchoolData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;


  late RxString selectedTypeTimeId;
  List<String> typeTime = [
    "صيفي",
    "شتوي",
  ];


  @override
  void onInit() {
    selectedTypeTimeId = ''.obs;
    nameSchool = TextEditingController();
    phone = TextEditingController();
    userName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    super.onInit();

    // nameSchool = TextEditingController();
  }
tes(){
  statusRequest = StatusRequest.loading;
  update();
}
  signUp()async{
    if(formState.currentState!.validate()){
      if(Global.latitude.value.toString()== "0.0"&& Global.longitude.value.toString()=="0.0"){
        // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
        CustomDialogWidget(message: "يجب اضافة الموقع").dialog();
        print("null location ------------------------");
        return ;
      }
      if(selectedTypeTimeId.value ==""){
        CustomDialogWidget(message: "يجب تحديد نوع فترة الدوام ",typeImage: 1).dialog();

        print("---------- user $selectedTypeTimeId");
        return ;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpSchoolData.postData(
        timeing: selectedTypeTimeId.value=="صيفي"?1:0,
          schoolName: nameSchool.text,userName: userName.text,pass: password.text,
      email: email.text,phone: phone.text,lat: Global.latitude.value.toDouble(),long:Global.longitude.value,);
      print("=========================== controller $response");
      statusRequest = handlingData(response);
      //
      if( StatusRequest.success==statusRequest){
        if(response["status"]=="success"){
          // sharedPreferences.setString(Global.step,"2");
          CustomDialogWidget(message:response["message"].toString()).dialog();

          Get.toNamed(AppRoutes.successSignUp);

        }else{
          Get.defaultDialog(title: "Warring",middleText: response["status"]);
          statusRequest = StatusRequest.failure;
        }
      }else{
        statusRequest = StatusRequest.failure;
      }
      update();
      print("valid");
    }else{
      print("no valid");
    }
  }
}