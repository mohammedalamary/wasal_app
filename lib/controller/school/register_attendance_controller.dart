
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/function/custom_dilaog.dart';
import 'package:wasl/main.dart';

import '../../core/class/stausrequest.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/school/add_attendance_time.dart';

class RegisterAttendanceController extends GetxController{
  var presenceTime = TimeOfDay.now().obs;
  String fromHour = "";
  String toHour = "";
  var departureTime = TimeOfDay.now().obs;


  var  selectedTypePermanence = "".obs;
  void upDateSelected(String value){
    selectedTypePermanence.value = value;
  }
  final List<String> typePermanence = [
    "صيفي",
    "شتوي",
  ];

  AddAttendanceTimeData  attendanceTimeData = AddAttendanceTimeData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  addAttendance()async{

    if(selectedTypePermanence.value.toString()== ""){
      // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
      CustomDialogWidget(message: "يجب اضافة نوع الدوام").dialog();
      return ;
    }
      statusRequest = StatusRequest.loading;
      update();
      var response = await attendanceTimeData.postData(schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()),
          timeType:selectedTypePermanence.value=="صيفي"?1:0,presenIn:fromHour,
          outSchool:toHour);


      print("=========================== controller $response");
      statusRequest = handlingData(response);
      //
      if( StatusRequest.success==statusRequest){
        if(response["status"]=="1"){
          CustomDialogWidget(message:response["message"].toString()).dialog();
        }else{
          CustomDialogWidget(message:response["message"].toString(),typeImage: 1).dialog();
          statusRequest = StatusRequest.failure;
        }
      }else{
        statusRequest = StatusRequest.failure;
      }
      update();
      print("valid");
    }



  chooseTime({int? typeHour})async{
    TimeOfDay? pickedTime = await showTimePicker(context: Get.context!,
        initialTime: presenceTime.value ,
    initialEntryMode: TimePickerEntryMode.input,
      builder: (context,child){
      return Theme(data: ThemeData.dark(), child: child!);
      },
      cancelText: "الغاء",
      confirmText: "تاكيد",
      helpText: "قم باختيار الوقت",
      errorInvalidText: "يجب اختيار وقت صحيح",
      hourLabelText: "اضف الوقت",
      minuteLabelText: "اضف الثواني"
    );
    if(typeHour==1){
      if(pickedTime !=null && pickedTime!= presenceTime.value){
        presenceTime.value = pickedTime;
      }
    }else{
      if(pickedTime !=null && pickedTime!= departureTime.value){
        departureTime.value = pickedTime;
      }
    }

  }
}