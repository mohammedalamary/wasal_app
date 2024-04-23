import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/driver/get_student.dart';
import '../../data/model/driverstudent.dart';
import '../../main.dart';

class RegisteredStudentsController extends GetxController{
  GetStudentDriverData  getStudentDriverData = GetStudentDriverData(Get.find());
  List<DriverStudent> driverStudentList = [];
  var  selectedTypeSchool = "".obs;

  StatusRequest? statusRequest =StatusRequest.none;
  // StatusRequest? statusRequestDeleteCompliant =StatusRequest.none;

  int? complaintId  ;

  @override
  void onInit() {
    getDataStudent();
    super.onInit();
  }

  getDataStudent()async{
    driverStudentList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getStudentDriverData.getStudentData(
        driverId:int.parse( sharedPreferences.getString(Global.driverId).toString()),
    schoolId: int.parse( sharedPreferences.getString(Global.schoolId).toString())
    );
    print(" get student  data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        driverStudentList.addAll(responseData.map((e) => DriverStudent.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



}