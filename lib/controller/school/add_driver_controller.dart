import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/main.dart';
import '../../../core/class/stausrequest.dart';
import '../../../core/function/custom_dilaog.dart';
import '../../../core/function/handlingdatacontroller.dart';
import '../../../data/datasource/remote/school/signup.dart';
import '../../data/datasource/remote/school/add_driver.dart';

class AddDriverController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController nameDriver,identity,phone,userName,password,email,busNumber  ;
  RxDouble latitude  = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  AddDriverData  addDriverData = AddDriverData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;




  @override
  void onInit() {
    nameDriver = TextEditingController();
    phone = TextEditingController();
    userName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    busNumber = TextEditingController();
    identity = TextEditingController();
    super.onInit();

    // nameSchool = TextEditingController();
  }
  tes(){
    statusRequest = StatusRequest.loading;
    update();
  }
  addDriver()async{
    if(formState.currentState!.validate()){
      if(Global.latitude.value.toString()== "0.0"&& Global.longitude.value.toString()=="0.0"){
        // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
        CustomDialogWidget(message: "يجب اضافة الموقع").dialog();
        print("null location ------------------------");
        return ;
      }

      statusRequest = StatusRequest.loading;
      update();
      var response = await addDriverData.postData(name: nameDriver.text,userName: userName.text,pass: password.text,
          email: email.text,phone: phone.text,lat: Global.latitude.value.toInt(),long:Global.longitude.value.toInt(),
          busNumber:busNumber.text.toString(),identity:identity.text, neighbourhood: "",
          schoolId:sharedPreferences.getString(Global.schoolId),);

      print("=========================== controller $response");
      statusRequest = handlingData(response);
      //
      if( StatusRequest.success==statusRequest){
        if(response["status"]=="success"){
          sharedPreferences.setString(Global.step,"2");
          Get.toNamed(AppRoutes.navigationSchool);
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