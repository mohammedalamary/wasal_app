import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/main.dart';
import '../../../../core/class/stausrequest.dart';
import '../../../../core/function/custom_dilaog.dart';


class ProfileDriverController extends GetxController{

  late TextEditingController password,email,userName;
  // UpdateAccountParentData  updateAccountParentData = UpdateAccountParentData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;





  @override
  void onInit() {
    password = TextEditingController(text:sharedPreferences.getString(Global.password)??"");
    email = TextEditingController(text: sharedPreferences.getString(Global.studentEmail)??"");
    userName = TextEditingController(text: sharedPreferences.getString(Global.studentName)??"");
    super.onInit();

    // nameSchool = TextEditingController();
  }
  checkUpdate() {
    CustomDialogWidget(message: "هل انت متاكد من عملية تعديل البيانات",typeWidget: 1,onOky: (){
      Get.back();
      // updateAccount();
    }).dialog();
  }

  exitApp() {
    CustomDialogWidget(message: "هل تريد عملية تسحيل الخروج",typeWidget: 1,onOky: (){
      sharedPreferences.clear();
      sharedPreferences.setString(Global.step,"1");
      Get.offAllNamed(AppRoutes.login);
    }).dialog();
  }


  // updateAccount()async{
  //
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await updateAccountParentData.postData(email:email.text,pass:password.text,
  //       parentId:int.parse( sharedPreferences.getString(Global.parentId).toString()),name:userName.text);
  //   print("==========update account ================= controller $response");
  //   statusRequest = handlingData(response);
  //   //sharorah@gmail.com
  //   if( StatusRequest.success==statusRequest){
  //     if(response["status"]=="1"){
  //       sharedPreferences.setString(Global.driverName,userName.text.toString());
  //       sharedPreferences.setString(Global.driverEmail,email.text.toString());
  //       sharedPreferences.setString(Global.password,password.text.toString());
  //       CustomDialogWidget(message:response["message"].toString()).dialog();
  //
  //     }else{
  //       CustomDialogWidget(message:response["message"].toString()).dialog();
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }else{
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  //   print("valid");
  // }
}