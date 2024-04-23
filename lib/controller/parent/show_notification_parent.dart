import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/routes.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/get_notification.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/model/notifications.dart';
import '../../main.dart';
import '../../view/screen/schools/show_notification_school.dart';

class ShowNotificationParentController extends GetxController{
  NotificationParentData  notificationParentData = NotificationParentData(Get.find());
  StatusRequest? statusRequestShowNot =StatusRequest.none;
  List<Notifications> notificationData = [];


  @override
  void onInit() {
    getNotifications();

    super.onInit();
  }

  // toNotify  يتم ارسال الاشعار الى
  // 1 ادا كان ولي امر
  //2 سائق
  //3 طالب
  getNotifications()async{
    notificationData.clear();
    statusRequestShowNot = StatusRequest.loading;
    update();
    var response = await notificationParentData.getNotificationData(
        schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()));

    print(" get notificationData data ===========================   controller $response");
    statusRequestShowNot = handlingData(response);
    if(statusRequestShowNot == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        notificationData.addAll(responseData.map((e) => Notifications.fromJson(e)).toList());
      }else{
        statusRequestShowNot = StatusRequest.failure;
      }
    }
    update();
  }

}