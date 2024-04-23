import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/data/datasource/remote/school/login.dart';
import 'package:wasl/main.dart';
import '../../../core/class/stausrequest.dart';
import '../../../core/function/custom_dilaog.dart';
import '../../../core/function/handlingdatacontroller.dart';
import '../../../data/datasource/remote/school/signup.dart';

class LoginSchoolController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password,email  ;
  RxBool obscureText = true.obs;
  LoginSchoolData  loginSchoolData = LoginSchoolData(Get.find());

  StatusRequest? statusRequest =StatusRequest.none;


  late RxString selectedUserId;
  List<String> typeUser = [
    'طالب',
    'مدرسة',
    'ولي امر',
    'سائق',
  ];


  @override
  void onInit() {
    selectedUserId = ''.obs;

    password = TextEditingController();
    email = TextEditingController();
    super.onInit();

    // nameSchool = TextEditingController();
  }

  tes(){
    statusRequest = StatusRequest.loading;
    update();
  }

  loginPost()async{
    if(formState.currentState!.validate()){
      if(selectedUserId.value ==""){
        CustomDialogWidget(message: "يجب تحديد نوع المستخدم ").dialog();
        print("---------- user $selectedUserId");
        return ;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginSchoolData.postData(email:email.text,pass:password.text,
          typeUser:selectedUserId.value.toString()=="مدرسة"?1:selectedUserId.value.toString()=="ولي امر"?2
              :selectedUserId.value=="سائق"?3:4);
      print("=========================== controller $response");
      statusRequest = handlingData(response);

      //sharorah@gmail.com
      if( StatusRequest.success==statusRequest){
        if(response["status"]=="1"){
          sharedPreferences.setString(Global.typeUser,response["typeUser"].toString());

          if(selectedUserId.value=="مدرسة"){
            sharedPreferences.setDouble(Global.latitudeAllUser,response["data"]["Sc_latitude"]);
            sharedPreferences.setDouble(Global.longitudeAllUser,response["data"]["Sc_longitude"]);
          sharedPreferences.setString(Global.step,"2");
          sharedPreferences.setString(Global.schoolId,response["data"]["Sc_id"].toString());
          sharedPreferences.setString(Global.schoolName,response["data"]["Sc_name"]);
          sharedPreferences.setString(Global.schoolEmail,response["data"]["Sc_email"]);
          sharedPreferences.setString(Global.password,response["data"]["Sc_pass"]);
          Get.toNamed(AppRoutes.navigationSchool);
        }else if(selectedUserId.value=="ولي امر"){
            print("all data ------------- $response");
            sharedPreferences.setDouble(Global.latitudeAllUser,double.parse(response["data"]["lat"].toString()));
            sharedPreferences.setDouble(Global.longitudeAllUser,double.parse(response["data"]["long"].toString()));
            sharedPreferences.setString(Global.step,"3");
            sharedPreferences.setString(Global.parentId,response["data"]["Pa_id"].toString());
            sharedPreferences.setString(Global.parentName,response["data"]["Pa_name"]);
            sharedPreferences.setString(Global.parentEmail,response["data"]["Pa_email"]);
            sharedPreferences.setString(Global.password,response["data"]["Pa_pass"]);
            sharedPreferences.setString(Global.schoolId,response["data"]["Sc_id"].toString());
            // sharedPreferences.setString(Global.driverId,response["data"]["bus_id"].toString());

            Get.toNamed(AppRoutes.homeNavigationParent);
          }else if(selectedUserId.value=="سائق"){
            sharedPreferences.setDouble(Global.latitudeAllUser,response["data"]["Dr_latitude"]);
            sharedPreferences.setDouble(Global.longitudeAllUser,response["data"]["Dr_longitude"]);
            sharedPreferences.setString(Global.step,"4");
            sharedPreferences.setString(Global.driverId,response["data"]["Bu_id"].toString());
            sharedPreferences.setString(Global.driverName,response["data"]["Dr_name"].toString());
            sharedPreferences.setString(Global.driverEmail,response["data"]["Dr_email"].toString());
            sharedPreferences.setString(Global.password,response["data"]["Dr_pass"]);
            sharedPreferences.setString(Global.schoolId,response["data"]["Sc_id"].toString());
            Get.toNamed(AppRoutes.homeNavigationDriver);
          }
          else if(selectedUserId.value=="طالب"){
            sharedPreferences.setString(Global.step,"5");
            sharedPreferences.setDouble(Global.latitudeAllUser,response["data"]["St_latitude"]);
            sharedPreferences.setDouble(Global.longitudeAllUser,response["data"]["St_longitude"]);
            sharedPreferences.setString(Global.driverId,response["data"]["bus_id"].toString());
            sharedPreferences.setString(Global.studentName,response["data"]["St_name"].toString());
            sharedPreferences.setString(Global.studentEmail,response["data"]["St_email"].toString());
            sharedPreferences.setString(Global.password,response["data"]["St_pass"]);
            sharedPreferences.setString(Global.schoolId,response["data"]["sc_id"].toString());
            sharedPreferences.setString(Global.parentId,response["data"]["pa_id"].toString());
            sharedPreferences.setString(Global.studentId,response["data"]["St_id"].toString());
            Get.toNamed(AppRoutes.homeStudentNavigation);
          }
        }
          else{
          CustomDialogWidget(message:response["message"].toString(),typeImage: 1).dialog();
          statusRequest = StatusRequest.failure;
        }
      }else{
        statusRequest = StatusRequest.failure;
      }
      update();
      print("valid");
    }else{
      print("no valid");
    }
  }
}