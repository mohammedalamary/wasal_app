import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/view/screen/students/notifiction_student.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/get_notification.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/datasource/remote/student/notification_data.dart';
import '../../data/model/notifications.dart';
import '../../main.dart';
import '../../view/screen/schools/show_notification_school.dart';

class ShowNotificationStudentController extends GetxController{
  NotificationStudentData  notificationStudentData = NotificationStudentData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  List<Notifications> notificationData = [];


  @override
  void onInit() {
    getNotifications();

    super.onInit();
  }
  getNotifications()async{
    notificationData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationStudentData.getNotificationData(
        schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()),
    busId: int.parse(sharedPreferences.getString(Global.driverId).toString())
    );

    print(" get notificationData data  student===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        notificationData.addAll(responseData.map((e) => Notifications.fromJson(e)).toList());
      }
      else{
        statusRequest = StatusRequest.failure;
      }

    }
    update();
  }

}