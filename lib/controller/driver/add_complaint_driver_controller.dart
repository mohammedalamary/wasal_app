import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/driver/get_complaints.dart';
import '../../data/datasource/remote/parent/complaints_parent.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/model/notifications.dart';
import '../../data/model/school.dart';
import '../../main.dart';

class AddComplaintsDriverController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GetComplaintsDriverData  getComplaintsDriverData = GetComplaintsDriverData(Get.find());
  var  selectedTypeSchool = "".obs;
  int schoolId = 0;
  void upDateSelectedSchool(String value){
    selectedTypeSchool.value = value;
  }
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestAddComp =StatusRequest.none;
  late TextEditingController complaintsText ;



  @override
  void onInit() {

    complaintsText =TextEditingController();
    super.onInit();
  }
  addComplaint()async {
    if (formState.currentState!.validate()) {

      statusRequestAddComp = StatusRequest.loading;
      update();
      var response = await getComplaintsDriverData.addComplaintsData(
          driverId:int.parse(sharedPreferences.getString(Global.driverId).toString()),
          schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()),
          userName:sharedPreferences.getString(Global.driverName),
          comText:complaintsText.text.toString(),
          comFrom:2,
          comTo:1,
      );
      print("===============add  complaint driver ============ controller $response");
      statusRequestAddComp = handlingData(response);
      //
      if (StatusRequest.success == statusRequestAddComp) {
        if (response["status"] == "success") {
          // notifyText.clear();
          complaintsText.clear();
          CustomDialogWidget(message: response["message"].toString()).dialog();
        } else {
          CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();
          statusRequestAddComp = StatusRequest.failure;
        }
      } else {
        statusRequestAddComp = StatusRequest.failure;
      }
      update();
      print("valid");
    }
  }
}