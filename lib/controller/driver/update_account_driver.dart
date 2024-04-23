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

class UpdateAccountDriverController extends GetxController{

  late TextEditingController password,email,userName;
  UpdateAccountDriverData  updateAccountDriverData = UpdateAccountDriverData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;


  @override
  void onInit() {
    password = TextEditingController(text:sharedPreferences.getString(Global.password)??"");
    email = TextEditingController(text: sharedPreferences.getString(Global.driverEmail)??"");
    userName = TextEditingController(text: sharedPreferences.getString(Global.driverName)??"");
    super.onInit();
  }
  updateAccount()async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await updateAccountDriverData.postData(email:email.text,pass:password.text,
        driverId:int.parse( sharedPreferences.getString(Global.driverId).toString()),name:userName.text);
    print("==========update account ================= controller $response");
    statusRequest = handlingData(response);
    //sharorah@gmail.com
    if( StatusRequest.success==statusRequest){
      if(response["status"]=="1"){
        sharedPreferences.setString(Global.driverName,userName.text.toString());
        sharedPreferences.setString(Global.driverEmail,email.text.toString());
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