import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/data/datasource/remote/school/complaint_school.dart';
import 'package:wasl/main.dart';

import '../../core/class/stausrequest.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/school/add_student_tobus.dart';
import '../../data/model/bus.dart';
import '../../data/model/complaint.dart';
import '../../data/model/student.dart';

class AddStudentToBusController extends GetxController{
  AddStudentToBusSchoolData  addStudentToBusSchoolData = AddStudentToBusSchoolData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestAddStudent =StatusRequest.none;
  StatusRequest? statusRequestBus =StatusRequest.none;

  List<StudentModel> studentDataList = [];
  List<BusModel> busData = [];
  late TextEditingController replyComplaintController ;
  RxBool showDetails=false.obs;
  int busId= 0;

  // var  selectedTypeBus = "".obs;
  Rx<BusModel?> selectedTypeBus = Rx<BusModel?>(null);

  // void upDateSelected(String value){
  //   selectedTypeBus.value = value;
  // }
  @override
  void onInit() {
    replyComplaintController =TextEditingController();
    getStudent();
    getBusData();
    super.onInit();
  }

  getStudent()async{
    studentDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addStudentToBusSchoolData.getStudentData(
      status: 1,
        active: 1,
        schoolId:int.parse( sharedPreferences.getString(Global.schoolId).toString()),);

    print(" get student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        studentDataList.addAll(responseData.map((e) => StudentModel.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  getBusData()async{
    busData.clear();
    statusRequestBus = StatusRequest.loading;
    update();
    var response = await addStudentToBusSchoolData.viewBusData(schoolId:int.parse( sharedPreferences.getString(Global.schoolId).toString()));

    print(" get student data ===========================   controller $response");
    statusRequestBus = handlingData(response);
    if(statusRequestBus == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        busData.addAll(responseData.map((e) => BusModel.fromJson(e)).toList());
        // studentDataList.addAll(responseData.map((e) => StudentModel.fromJson(e)).toList());
        // selectedTypeBus.value = busData.first.toString();
      }else{
        statusRequestBus = StatusRequest.failure;
      }
    }
    update();
  }
  addStudentToBus({int? studentId})async {
    if(busId== 0){
      CustomDialogWidget(message: "يجب اختيار اسم السائق من القائمة ").dialog();
      return ;
    }
      statusRequestAddStudent = StatusRequest.loading;
      update();
      var response = await addStudentToBusSchoolData.addStudentToBusData(
          studentId:studentId,busId: busId,status:2);


      print(" add student post =========================== controller $response");
      statusRequestAddStudent = handlingData(response);
      //
      if (StatusRequest.success == statusRequestAddStudent) {
        if (response["status"] == "1") {
          replyComplaintController.clear();
          getStudent();
          CustomDialogWidget(message: response["message"].toString()).dialog();
        } else {
          CustomDialogWidget(typeImage: 1,message: response["message"].toString()).dialog();
          statusRequestAddStudent = StatusRequest.failure;
        }
      } else {
        statusRequestAddStudent = StatusRequest.failure;
      }
      update();
      print("valid");
    }





}