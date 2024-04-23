import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wasl/core/constant/global.dart';
import '../../core/class/stausrequest.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/addstudent.dart';
import '../../data/datasource/remote/parent/post_order_children.dart';
import '../../data/model/parent_student.dart';
import '../../data/model/school.dart';
import '../../main.dart';

class ListOfChildrenAndRequestsController extends GetxController{

  PostOrderChildrenData  postOrderChildrenData = PostOrderChildrenData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestNoActive =StatusRequest.none;

  List<ParentStudent> parentStudentList = [];
  List<ParentStudent> parentStudentListNoActive = [];

  @override
  void onInit() {


    getStudentActive();
    getStudentNoActive();
    super.onInit();

  }

  getStudentActive()async{
    parentStudentList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await postOrderChildrenData.getStudentActiveDat(parentId:
    int.parse(sharedPreferences.getString(Global.parentId).toString()));

    print(" get school data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        parentStudentList.addAll(responseData.map((e) => ParentStudent.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  getStudentNoActive()async{
    parentStudentListNoActive.clear();
    statusRequestNoActive = StatusRequest.loading;
    update();
    var response = await postOrderChildrenData.getStudentNoActiveDat(parentId:
    int.parse(sharedPreferences.getString(Global.parentId).toString()));

    print(" get parent Student List No Active account ===========================   controller $response");
    statusRequestNoActive = handlingData(response);
    if(statusRequestNoActive == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        parentStudentListNoActive.addAll(responseData.map((e) => ParentStudent.fromJson(e)).toList());
      }else{
        statusRequestNoActive = StatusRequest.failure;
      }
    }
    update();
  }



}