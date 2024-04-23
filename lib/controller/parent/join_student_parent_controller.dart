import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wasl/core/constant/global.dart';
import '../../core/class/stausrequest.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/addstudent.dart';
import '../../data/model/school.dart';
import '../../main.dart';

class JoinStudentParentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();

late TextEditingController birthdateController,parentName,parentPhone,parentIdentity,studentName,studentIdentity,levelStudent,graderStudent;
AddStudentParentData  addStudentParentData = AddStudentParentData(Get.find());
StatusRequest? statusRequest =StatusRequest.none;
StatusRequest? statusRequestAddStudent =StatusRequest.none;
List<ModelSchool> schoolData = [];

var  selectedTypeSchool = "".obs;

RxBool checkActivateWarranty= false.obs;

int schoolId = 0;
void upDateSelected(String value){
  selectedTypeSchool.value = value;
}
  @override
  void onInit() {
    birthdateController =TextEditingController();
    parentName =TextEditingController();
    parentPhone =TextEditingController();
    parentIdentity =TextEditingController();
    studentName =TextEditingController();
    studentIdentity =TextEditingController();
    levelStudent =TextEditingController();
    graderStudent =TextEditingController();
    getDataSchool();
    super.onInit();

  }

getDataSchool()async{
  schoolData.clear();
  statusRequest = StatusRequest.loading;
  update();
  var response = await addStudentParentData.getDataSchool();

  print(" get school data ===========================   controller $response");
  statusRequest = handlingData(response);
  if(statusRequest == StatusRequest.success){
    if(response["status"]=="success"){
      List responseData = response["data"];
      schoolData.addAll(responseData.map((e) => ModelSchool.fromJson(e)).toList());
    }else{
      statusRequest = StatusRequest.failure;
    }
  }
  update();
}
addStudent()async {
  if (formState.currentState!.validate()) {
    if(selectedTypeSchool.value.toString()== ""){
      // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
      CustomDialogWidget(message: "يجب اختيار المدرسة الدي سيتم اضافة الطالب اليها").dialog();
      return ;
    }
    statusRequestAddStudent = StatusRequest.loading;
    update();
    var response = await addStudentParentData.addStudentData(
      schoolId:schoolId.toInt(),
      birthData:birthdateController.text.toString(),
      guarantee:checkActivateWarranty.value==true?1:0,
      latitude: Global.latitude.toInt(),
      longitude: Global.longitude.toInt(),
      parentId:int.parse(sharedPreferences.getString(Global.parentId).toString()),
      parentIdentity: parentIdentity.text.toString(),
      parentName: parentName.text.toString(),
      parentPhone:parentPhone.text.toString(),
      studentIdentity:int.parse(studentIdentity.text.toString()),
      studentName:studentName.text.toString(),
      grader: graderStudent.text.toString(),
      level: levelStudent.text.toString()
      );


    print("============  add student =============== controller $response");
    statusRequestAddStudent = handlingData(response);
    //
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "1") {
        // notifyText.clear();
        // selectedTypeNotification.value="";
        Get.back();

        CustomDialogWidget(message: response["message"].toString()).dialog();
        Get.clearRouteTree();
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


  chooseBirthdate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      cancelText: "الغاء",
      confirmText: "موفق",
      fieldLabelText: "DOB",
      fieldHintText: "Date/Month/Year",
      errorFormatText: "Enter valid date",
      errorInvalidText: "Enter valid date or range",
      helpText: "اتاريخ الميلاد",
    );

    if (pickedDate != null) {
      var date;
      print("------------------- data $date");
      date = DateFormat('yyyy-MM-dd').format(pickedDate);
      birthdateController.text = date.toString();
      print("------------------------ ${ birthdateController.text }");
    }
  }

}