
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/add_accountforchildern.dart';
import '../../data/model/student.dart';
import '../../main.dart';

class AAttendanceDepartureParentController extends GetxController{
  var isChecked = <bool>[false, false, false, false].obs;


  AddAccountForChildrenData  addAccountForChildrenData = AddAccountForChildrenData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestPre =StatusRequest.none;
  List<StudentModel> studentDataList = [];

  // RxList<String> selectedOptions = <String>[].obs;
  // void handleOptionChange({String? value, int? index}) {
  //   selectedOptions[index!] = value!;
  // }
  RxInt selectedIndexAbsent = RxInt(-1);
  RxInt selectedIndexPresent = RxInt(-1);
  int studentId =0;
  int typePreparation =0;

  void setSelectedIndex(int index,int? type) {
    print("index ========= $index");
    if(type==0){
      typePreparation=0;
      selectedIndexAbsent.value = index;
      selectedIndexPresent.value =-1;
      print("typePreparation ========= $typePreparation");

    }else{
      typePreparation =1;
      print("typePreparation ========= $typePreparation");

      selectedIndexPresent.value = index;
      selectedIndexAbsent.value = -1;

    }
  }

  // int selectedIndex = -1;
  final RxString selectedOption = ''.obs;
  void handleOptionChange(String? value) {
    selectedOption.value = value!;
    print("val --------- $value");
  }

  var selectedValue = false.obs;
  var selectedValueTwo = false.obs;
  int typeAttendance =0;

  void setSelectedValue( value) {
    selectedValue.value = value;
  }
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
  // RxBool checkAttendance= false.obs;
  // RxBool noCheckAttendance= false.obs;
  //
  // change(){
  //   checkAttendance.value ==true?noCheckAttendance.value=false:noCheckAttendance.value=true;
  // }
  int currentPage = 0;
  late PageController pageController;

  @override
  void onInit() {
    getStudent();
    pageController = PageController();

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
  preparationStudentData()async{
    if(selectedIndexAbsent.value>1||selectedIndexPresent.value >1){
      CustomDialogWidget(message: "يجب اختيار الابن الدي سيتم تحضيرة او سيتم غيابة ",typeImage: 1).dialog();
      return ;
    }
    statusRequestPre = StatusRequest.loading;
    update();
    var response = await addAccountForChildrenData.preparationStudentData(studentId:studentId,date:
    Global.date,preparation:typePreparation);
    print(" get student data ===========================   controller $response");
    statusRequestPre = handlingData(response);
    if(statusRequestPre == StatusRequest.success){
      if(response["status"]=="success"){
        CustomDialogWidget(message: response["message"].toString()).dialog();
      }else{
        statusRequestPre = StatusRequest.failure;
        CustomDialogWidget(message: response["message"].toString()).dialog();

      }
    }
    update();
  }

}