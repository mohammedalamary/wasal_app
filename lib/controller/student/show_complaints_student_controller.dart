import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/complaints_parent.dart';
import '../../data/datasource/remote/school/add_notification.dart';
import '../../data/datasource/remote/student/student_complaint.dart';
import '../../data/model/complaint.dart';
import '../../data/model/complaint_parent.dart';
import '../../data/model/notifications.dart';
import '../../data/model/school.dart';
import '../../main.dart';

class ShowComplaintsStudentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ComplaintsStudentData  complaintsStudentData = ComplaintsStudentData(Get.find());
  List<ComplaintModel> complaintListData = [];
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
    complaintListData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await complaintsStudentData.getComplaintsData(
        studentId: int.parse( sharedPreferences.getString(Global.studentId).toString()),
    schoolId:  int.parse( sharedPreferences.getString(Global.schoolId).toString())
    );
    print(" get Complaints student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        complaintListData.addAll(responseData.map((e) => ComplaintModel.fromJson(e)).toList());
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
    },typeWidget:1).dialog();

  }
  deleteComplaint()async {


    statusRequestDeleteCompliant = StatusRequest.loading;
    update();
    var response = await complaintsStudentData.deleteComplaintsData(
      studentId: int.parse(sharedPreferences.getString(Global.studentId).toString()),
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