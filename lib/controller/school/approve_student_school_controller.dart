import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/school/order_student.dart';
import '../../data/model/student.dart';
import '../../main.dart';

class ApproveStudentSchoolController extends GetxController{
  OrderStudentSchoolData  orderStudentSchoolData = OrderStudentSchoolData(Get.find());

  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestApprove =StatusRequest.none;
  RxBool checkActivateStudent= false.obs;
  RxBool noActivateStudent= false.obs;
  int activeStudent = 0;
  // i;
  List<StudentModel> studentDataList = [];

 // late var  isChecked ;
  var isChecked = <bool>[false, false, false, false].obs;
  RxList<bool> isCheckedListActive = List.generate(1, (index) => false).obs;
  RxList<bool> isCheckedListReject = List.generate(1, (index) => false).obs;

  // قبول الطالب او رفضة
  changeActiveStudent({ val,int? type,int? index}){
    if(type==1){
      checkActivateStudent.value =true;
      noActivateStudent.value =false;
      // isChecked= index;
      activeStudent =1;


    }else if(type==2){
      // CustomDialogWidget(message: "رفض قبول الطالب بالانظام الى المدرسة").dialog();

      checkActivateStudent.value =false;
      noActivateStudent.value =true;
      activeStudent =2;
    }


    // visibleFeMale.value=0;
    // genderType.value =1;
    // print("---------------------${genderType.value}");
  }
  @override
  void onInit() {
    getStudent();
    super.onInit();
  }

  checkApprove({int? studentId}){
    CustomDialogWidget(message: "تاكيد قبول الطالب للانضمام للمدرسة ",typeWidget: 1,onOky: (){
      Get.back();
      checkApproveStudent(studentId:studentId );
    }).dialog();
  }
  getStudent()async{
    studentDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderStudentSchoolData.getStudentData(
      status: 0,
        active:0,
        schoolId:int.parse( sharedPreferences.getString(Global.schoolId).toString()));
    print(" get student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        studentDataList.addAll(responseData.map((e) => StudentModel.fromJson(e)).toList());
        isCheckedListActive.value = List<bool>.filled(studentDataList.length, false);
        isCheckedListReject.value = List<bool>.filled(studentDataList.length, false);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkApproveStudent({int? studentId})async{
    statusRequestApprove = StatusRequest.loading;
      update();
      // status ادل تم قبول  الطالب يتم ارسال 1 مالم يتم رفضه 2
      var response = await orderStudentSchoolData.checkApproveStudentData(
      schoolId: int.parse(sharedPreferences.getString(Global.schoolId).toString())  ,
        allowed:1,
        studentActiveAccount:activeStudent.toInt(),
        studentId:studentId,
        status:activeStudent==1?1:2
      );

      print("=========================== controller $response");
    statusRequestApprove = handlingData(response);
      //
      if( StatusRequest.success==statusRequest){
        if(response["status"]=="1"){
          CustomDialogWidget(message: response["message"].toString()).dialog();
          getStudent();
        }else{
          CustomDialogWidget(typeImage:1,message: response["message"].toString()).dialog();

          statusRequestApprove = StatusRequest.failure;
        }
      }else{
        statusRequestApprove = StatusRequest.failure;
      }
      update();
      print("valid");
    }


}