import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/data/datasource/remote/school/complaint_school.dart';
import 'package:wasl/main.dart';

import '../../core/class/stausrequest.dart';
import '../../core/function/custom_dilaog.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/model/complaint.dart';

class ComplaintSchoolController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  ComplaintSchoolData  complaintSchoolData = ComplaintSchoolData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestReplay =StatusRequest.none;
  List<ComplaintModel> complaintData = [];
  late TextEditingController replyComplaintController ;
  RxBool showDetails=false.obs;
  RxInt detailsIndex=1.obs;


  @override
  void onInit() {
    replyComplaintController =TextEditingController();
    getComplaint();
    super.onInit();
  }

  getComplaint()async{
      complaintData.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await complaintSchoolData.getData(schoolId:int.parse( sharedPreferences.getString(Global.schoolId).toString()));

      print(" get complaint data ===========================   controller $response");
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response["status"]=="1"){
          List responseData = response["data"];
          complaintData.addAll(responseData.map((e) => ComplaintModel.fromJson(e)).toList());
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }

  replayComplaint({int? complaintId})async {
    if (formState.currentState!.validate()) {

      statusRequestReplay = StatusRequest.loading;
      update();
      var response = await complaintSchoolData.postData(
          schoolId:int.parse(sharedPreferences.getString(Global.schoolId).toString()),
      replayComp: replyComplaintController.text,complaintId:complaintId);


      print(" replay complaint post =========================== controller $response");
      statusRequestReplay = handlingData(response);

      if (StatusRequest.success == statusRequestReplay) {
        if (response["status"] == "1") {
          replyComplaintController.clear();
          CustomDialogWidget(message: response["message"].toString()).dialog();
        } else {
          CustomDialogWidget(message: response["message"].toString(),typeImage: 1).dialog();
          statusRequestReplay = StatusRequest.failure;
        }
      } else {
        statusRequestReplay = StatusRequest.failure;
      }
      update();
      print("valid");
    }
  }


}