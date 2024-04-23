import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/controller/parent/show_complaints_parent_controller.dart';
import 'package:wasl/core/constant/routes.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/complaints_parent.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/model/bus.dart';
import '../../data/model/notifications.dart';
import '../../data/model/school.dart';
import '../../main.dart';

class AddComplaintsParentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ComplaintsParentData  complaintsParentData = ComplaintsParentData(Get.find());
  List<BusModel> busData = [];
  var  selectedTypeSchool = "".obs;
  int busId = 0;
  void upDateSelectedSchool(String value){
    selectedTypeSchool.value = value;
  }

  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestAddComp =StatusRequest.none;
  late TextEditingController complaintsText ;

  var  selectedTypeComplaints = "".obs;
  int toComplaint = 0;
  RxBool showBusVisible = false.obs;
  void upDateSelected(String value){
    selectedTypeComplaints.value = value;
    toComplaint = selectedTypeComplaints.value == "المدرسة"?1:2;
    showBusVisible.value = selectedTypeComplaints.value == "سائق"?true:false;

    print("complaints -------- $toComplaint");
    print("showBusVisible -------- bus $toComplaint");
  }
  final List<String> typeComplaints = [
    "المدرسة",
    "سائق",
  ];

  @override
  void onInit() {
    getDataBus();

    complaintsText =TextEditingController();
    super.onInit();
  }

  getDataBus()async{
    busData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await complaintsParentData.getDataDriver(
        schoolId: int.parse(sharedPreferences.getString(Global.schoolId).toString()));

    print(" get  data  driver ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        busData.addAll(responseData.map((e) => BusModel.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  addComplaint()async {
    if (formState.currentState!.validate()) {
      if(selectedTypeComplaints.value.toString()== ""){
        CustomDialogWidget(message: "يجب تحديد الشكوئ الى اي شخص تدهب ",typeImage: 1).dialog();
        return ;
      }
      // if(selectedTypeSchool.value.toString()== ""){
      //   CustomDialogWidget(message: "يجب اختيار اسم المدرسة ").dialog();
      //   return ;
      // }
      statusRequestAddComp = StatusRequest.loading;
      update();
      var response = await complaintsParentData.addComplaintsData(
        parentId:int.parse(sharedPreferences.getString(Global.parentId).toString()),
        schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()),
        userName:sharedPreferences.getString(Global.parentName),
        comText:complaintsText.text.toString(),
        comFrom:1,
        comTo:toComplaint.toInt(),
        busId:showBusVisible.value==true?busId.toString():0,
      );


      print("=============== complaint ============ controller $response");
      statusRequestAddComp = handlingData(response);
      //
      if (StatusRequest.success == statusRequestAddComp) {
        if (response["status"] == "success") {
          // notifyText.clear();
          selectedTypeComplaints.value="";
          complaintsText.clear();
          Get.find<ShowComplaintsParentController>().getDataComplaint();
          Get.offNamed(AppRoutes.showComplaintsParentView);
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
  // getNotifications()async{
  //   notificationData.clear();
  //   statusRequestShowNot = StatusRequest.loading;
  //   update();
  //   var response = await addNotificationSchoolData.getNotficationData(
  //       schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()));
  //
  //   print(" get notificationData data ===========================   controller $response");
  //   statusRequestShowNot = handlingData(response);
  //   if(statusRequestShowNot == StatusRequest.success){
  //     if(response["status"]=="1"){
  //       List responseData = response["data"];
  //       notificationData.addAll(responseData.map((e) => Notifications.fromJson(e)).toList());
  //     }else{
  //       statusRequestShowNot = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

}