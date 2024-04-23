import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/main.dart';
import '../../core/class/stausrequest.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/add_accountforchildern.dart';
import '../../data/model/student.dart';
class AddAccountForChildrenParentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController userName,userPassword,email;
  AddAccountForChildrenData  addAccountForChildrenData = AddAccountForChildrenData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestAddStudent =StatusRequest.none;
  List<StudentModel> studentDataList = [];
  var  selectedTypeStudent = "".obs;

  RxBool checkActivateAttendees= false.obs;

  int studentId = 0;
  void upDateSelected(String value){
    selectedTypeStudent.value = value;
  }
  @override
  void onInit() {

    userName =TextEditingController();
    userPassword =TextEditingController();
    email =TextEditingController();

    getStudent();
    super.onInit();

  }

  getStudent()async{
    studentDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addAccountForChildrenData.getChildrenData(
        parentId:int.parse(sharedPreferences.get(Global.parentId).toString()));


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
  addStudent()async {
    if (formState.currentState!.validate()) {
      if(selectedTypeStudent.value.toString()== ""){
        // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
        CustomDialogWidget(message: "يجب اختيار الابن الدي سيتم اضافة حساب له",typeImage: 1).dialog();
        return ;
      }
      statusRequestAddStudent = StatusRequest.loading;
      update();
      var response = await addAccountForChildrenData.addAccountData(
        parentId:int.parse(sharedPreferences.getString(Global.parentId).toString()),
        email: email.text.toString(),
        studentId:studentId.toInt(),
        allowed: checkActivateAttendees.value==true?1:0,
        studentName: userName.text.toString(),
        studentPassword:userPassword.text,
      );


      print("============  add student =============== controller $response");
      statusRequestAddStudent = handlingData(response);
      //
      if (StatusRequest.success == statusRequestAddStudent) {
        if (response["status"] == "success") {
          userName.clear();
          userPassword.clear();
          email.clear();
          // selectedTypeNotification.value="";
          Get.back();
          CustomDialogWidget(message: response["message"].toString()).dialog();
        } else {
          CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();
          statusRequestAddStudent = StatusRequest.failure;
        }
      } else {
        statusRequestAddStudent = StatusRequest.failure;
      }
      update();
      print("valid");
    }
  }
}