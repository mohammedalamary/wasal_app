import 'package:get/get.dart';

import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/student/bus_infromation.dart';
import '../../data/model/bus_information_student.dart';
import '../../main.dart';

class InformationDriverStudentController extends GetxController{

  BusInformationStudentData  busInformationStudentData = BusInformationStudentData(Get.find());
  List<BusInfoStudent> busInformationList = [];
  StatusRequest? statusRequest =StatusRequest.none;

  @override
  void onInit() {
    getBusInfoData();
    super.onInit();

  }
  getBusInfoData()async{
    busInformationList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await busInformationStudentData.busInfoData(
        studentId: int.parse( sharedPreferences.getString(Global.studentId).toString()),busId:
    int.parse(sharedPreferences.getString(Global.driverId).toString()));
    print(" get Bus Info Student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        busInformationList.addAll(responseData.map((e) => BusInfoStudent.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}