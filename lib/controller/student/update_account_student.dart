import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/data/datasource/remote/school/login.dart';
import 'package:wasl/main.dart';
import '../../../core/class/stausrequest.dart';
import '../../../core/function/custom_dilaog.dart';
import '../../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/driver/update_account.dart';
import '../../data/datasource/remote/parent/account_parent.dart';
import '../../data/datasource/remote/school/update_account_school.dart';
import '../../data/datasource/remote/student/update_account.dart';

class UpdateAccountStudentController extends GetxController{

  late TextEditingController password,email,userName;
  UpdateAccountStudentData  updateAccountStudentData = UpdateAccountStudentData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;


  @override
  void onInit() {
    password = TextEditingController(text:sharedPreferences.getString(Global.password)??"");
    email = TextEditingController(text: sharedPreferences.getString(Global.studentEmail)??"");
    userName = TextEditingController(text: sharedPreferences.getString(Global.studentName)??"");
    super.onInit();
  }
  updateAccount()async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await updateAccountStudentData.postData(email:email.text,pass:password.text,
        studentId:int.parse( sharedPreferences.getString(Global.studentId).toString()),name:userName.text);
    print("==========update account student ================= controller $response");
    statusRequest = handlingData(response);
    //sharorah@gmail.com
    if( StatusRequest.success==statusRequest){
      if(response["status"]=="1"){
        sharedPreferences.setString(Global.studentName,userName.text.toString());
        sharedPreferences.setString(Global.studentEmail,email.text.toString());
        sharedPreferences.setString(Global.password,password.text.toString());
        CustomDialogWidget(message:response["message"].toString()).dialog();
      }else{
        CustomDialogWidget(message:response["message"].toString(),typeImage: 1).dialog();
        statusRequest = StatusRequest.failure;
      }
    }else{
      statusRequest = StatusRequest.failure;
    }
    update();
    print("valid");
  }
}