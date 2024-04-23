import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/data/model/ourschool.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/school/our_contact_school.dart';
import '../../main.dart';

class OurContactsSchoolController extends  GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  OurContactSchoolData ourContactSchoolData = OurContactSchoolData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;

  List<OurSchool> studentDataList = [];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    getStudent();
    super.onInit();
  }

  getStudent()async{
    studentDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ourContactSchoolData.getStudentDat(
        schoolId:int.parse( sharedPreferences.getString(Global.schoolId).toString()));

    print(" get student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        studentDataList.addAll(responseData.map((e) => OurSchool.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}