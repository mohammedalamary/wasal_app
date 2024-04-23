import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/complaints_parent.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/model/complaint_parent.dart';
import '../../data/model/notifications.dart';
import '../../data/model/school.dart';
import '../../main.dart';

class ShowComplaintsParentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ComplaintsParentData  complaintsParentData = ComplaintsParentData(Get.find());
  List<ComplaintsParent> complaintParentList = [];
  var  selectedTypeSchool = "".obs;

  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestDeleteCompliant =StatusRequest.none;


  int? complaintId  ;

  @override
  void onInit() {
    getDataComplaint();
    super.onInit();
  }

  getDataComplaint()async{
    complaintParentList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await complaintsParentData.getComplaint(
        parentId:int.parse( sharedPreferences.getString(Global.parentId).toString()));
    print(" get Complaints Parent data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        complaintParentList.addAll(responseData.map((e) => ComplaintsParent.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkDelete(){
    CustomDialogWidget(message: "هل انت متاكد من عملية حدف الشكوئ ",onOky: (){
      Get.back();
      deleteComplaint();
    },typeWidget:1,typeImage: 1).dialog();

  }
  deleteComplaint()async {


      statusRequestDeleteCompliant = StatusRequest.loading;
      update();
      var response = await complaintsParentData.deleteComplaint(
          parentId:int.parse(sharedPreferences.getString(Global.parentId).toString()),
        complaintId:complaintId!.toInt(),
      );


      print("===============delete  complaint ============ controller $response");
      statusRequestDeleteCompliant = handlingData(response);
      //
      if (StatusRequest.success == statusRequestDeleteCompliant) {
        if (response["status"] == "1") {
          // notifyText.clear();
          CustomDialogWidget(message: response["message"].toString()).dialog();
          getDataComplaint();
        } else {
          CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();
          statusRequestDeleteCompliant = StatusRequest.failure;
        }
      } else {
        statusRequestDeleteCompliant = StatusRequest.failure;
      }
      update();
      print("valid");
  }

}