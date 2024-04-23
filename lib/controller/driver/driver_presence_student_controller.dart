import 'package:get/get.dart';
import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/driver/driver_presence_student.dart';
import '../../data/model/driverpresencestudent.dart';
import '../../data/model/driverstudent.dart';
import '../../main.dart';
class DriverPresenceStudentController extends GetxController{
  DriverPresenceStudentData  driverPresenceStudentData = DriverPresenceStudentData(Get.find());
  List<DriverPresenceStudent> presenceStudentList = [];
  var  selectedTypeSchool = "".obs;

  StatusRequest? statusRequest =StatusRequest.none;
  // StatusRequest? statusRequestDeleteCompliant =StatusRequest.none;

  int? complaintId  ;

  @override
  void onInit() {
    getDataStudent();
    super.onInit();
  }

  getDataStudent()async{
    presenceStudentList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await driverPresenceStudentData.presenceStudent(
        driverId:int.parse( sharedPreferences.getString(Global.driverId).toString()),
        schoolId: int.parse( sharedPreferences.getString(Global.schoolId).toString()),
      date:Global.date.toString()
    );
    print(" get presence student  data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        presenceStudentList.addAll(responseData.map((e) => DriverPresenceStudent.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



}