import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/routes.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/driver/notification_data.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/model/notifications.dart';
import '../../main.dart';

class NotificationDriverController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  NotificationDriverData  notificationDriverData = NotificationDriverData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestShowNot =StatusRequest.none;
  late TextEditingController notifyText ;
  List<Notifications> notificationData = [];

  var  selectedTypeNotification = "".obs;
  int toNotify = 0;
  void upDateSelected(String value){
    selectedTypeNotification.value = value;
    toNotify = selectedTypeNotification =="ولي امر"?1:selectedTypeNotification=="سائق"?2:selectedTypeNotification=="الطالب"?3:4;

    print("toNotify -------- $toNotify");
  }
  final List<String> typeNotification = [
    "الطالب",
    "ولي امر",
    "الكل",
  ];

  @override
  void onInit() {
    getNotifications();

    notifyText =TextEditingController();
    super.onInit();
  }

  // toNotify  يتم ارسال الاشعار الى
  // 1 ادا كان ولي امر
  //2 سائق
  //3 طالب
  addNotification()async {
    if (formState.currentState!.validate()) {
      if(selectedTypeNotification.value.toString()== ""){
        // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
        CustomDialogWidget(message: "يجب اختيار نوع الاشعار",typeImage: 1).dialog();
        return ;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationDriverData.postData(
          notifyText: notifyText.text, notifyFrom:2,toNotify: toNotify,driverId:
      int.parse(sharedPreferences.getString(Global.driverId).toString()),
          schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()));
      print("=========================== controller $response");
      statusRequest = handlingData(response);
      //
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "1") {
          notifyText.clear();
          selectedTypeNotification.value="";
          getNotifications();
          Get.toNamed(AppRoutes.showNotificationDriver);
          CustomDialogWidget(message: response["message"].toString()).dialog();
        } else {
          CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      print("valid");
    }
  }
  getNotifications()async{
    notificationData.clear();
    statusRequestShowNot = StatusRequest.loading;
    update();
    var response = await notificationDriverData.getNotificationData(
        driverId:int.parse(sharedPreferences.getString(Global.driverId).toString()),
    schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString() )
    );
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