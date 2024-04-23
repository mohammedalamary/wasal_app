import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/routes.dart';
import '../../../core/class/stausrequest.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/signup_parent.dart';
import '../../data/model/school.dart';

class SignUpParentController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController nameParent,phone,userName,password,email ,parentIdentity ;
  RxDouble latitude  = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  StatusRequest? statusRequest =StatusRequest.none;
  SignUpParentData  signUpParentData = SignUpParentData(Get.find());
  StatusRequest? statusRequestSignUp =StatusRequest.none;
  List<ModelSchool> schoolData = [];
  var  selectedTypeSchool = "".obs;
  int schoolId = 0;
  void upDateSelected(String value){
    selectedTypeSchool.value = value;
  }


  @override
  void onInit() {
    parentIdentity = TextEditingController();
    nameParent = TextEditingController();
    phone = TextEditingController();
    userName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    getDataSchool();
    super.onInit();

    // nameSchool = TextEditingController();
  }
  tes(){
    statusRequest = StatusRequest.loading;
    update();
  }
  getDataSchool()async{
    schoolData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpParentData.getDataSchool();

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

  signUp()async{
    if(formState.currentState!.validate()){
      if(schoolId==0){
        // Get.defaultDialog(title: "تنبية",middleText:"يجب اضافة الموقع");
        CustomDialogWidget(message: "يجب اختيار اسم المدرسة",typeImage: 1).dialog();
        print("null location ------------------------");
        return ;
      }

      statusRequestSignUp = StatusRequest.loading;
      update();
      var response = await signUpParentData.signUpParentData(
          userName: userName.text,pass: password.text,
          email: email.text,phone: phone.text,
          schoolId:schoolId.toInt(),identity: int.parse(parentIdentity.text.toString()),name:nameParent.text.toString());
      print("=========================== controller $response");
      statusRequestSignUp = handlingData(response);
      //
      if( StatusRequest.success==statusRequestSignUp){
        if(response["status"]=="success"){
          CustomDialogWidget(message: response["message"].toString()).dialog();
          Get.offAllNamed(AppRoutes.login);

        }else{
          CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();
          statusRequestSignUp = StatusRequest.failure;
        }
      }else{
        statusRequestSignUp = StatusRequest.failure;
      }
      update();
      print("valid");
    }else{
      print("no valid");
    }
  }
}