
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/add_accountforchildern.dart';
import '../../data/datasource/remote/student/attendance_student.dart';
import '../../data/model/student.dart';
import '../../main.dart';

class AAttendanceStudentController extends GetxController{


  AttendanceStudentData  attendanceStudentData = AttendanceStudentData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;


  int selectedOption = -1;
  int preparationType = 0;

  void updateSelectedOption(int value) {
    selectedOption = value;
    update();

  }
  List<String> options = [
    'سيحضر',
    'لن يحضر',
  ];
  @override
  void onInit() {

    super.onInit();
  }

  attendanceStudent()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await attendanceStudentData.attendanceData(
        studentId:int.parse(sharedPreferences.get(Global.studentId).toString()),
    date: Global.date,
      preparation:preparationType,
    );


    print(" attendance student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="success"){
        CustomDialogWidget(message: response["message"].toString()).dialog();
      }else{
        statusRequest = StatusRequest.failure;
        CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();

      }
    }
    update();
  }

}