import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/controller/student/show_complaints_student_controller.dart';
import 'package:wasl/core/constant/routes.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';

import '../../data/datasource/remote/student/student_complaint.dart';
import '../../main.dart';

class AddComplaintsStudentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ComplaintsStudentData  complaintsStudentData = ComplaintsStudentData(Get.find());
  var  selectedTypeSchool = "".obs;
  int schoolId = 0;

  StatusRequest? statusRequestAddComp =StatusRequest.none;
  late TextEditingController complaintsText ;

  var  selectedTypeComplaints = "".obs;
  int toComplaint = 0;
  void upDateSelected(String value){
    selectedTypeComplaints.value = value;
    toComplaint = selectedTypeComplaints.value == "المدرسة"?1:2;

    print("complaints -------- $toComplaint");
  }
  final List<String> typeComplaints = [
    "المدرسة",
    "سائق",
  ];

  @override
  void onInit() {

    complaintsText =TextEditingController();
    super.onInit();
  }
  addComplaint()async {
    if (formState.currentState!.validate()) {

      statusRequestAddComp = StatusRequest.loading;
      update();
      var response = await complaintsStudentData.addComplaintsData(
        studentId:int.parse(sharedPreferences.getString(Global.studentId).toString()),
        schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()),
        userName:sharedPreferences.getString(Global.studentName),
        comText:complaintsText.text.toString(),
        comFrom:3,
        comTo:toComplaint,
        busId:int.parse(sharedPreferences.getString(Global.driverId).toString())
      );
      print("===============add  complaint student ============ controller $response");
      statusRequestAddComp = handlingData(response);
      //
      if (StatusRequest.success == statusRequestAddComp) {
        if (response["status"] == "success") {
          // notifyText.clear();
          complaintsText.clear();
          Get.find<ShowComplaintsStudentController>().getDataComplaint();
          Get.offAndToNamed(AppRoutes.showComplaintsStudentView);
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