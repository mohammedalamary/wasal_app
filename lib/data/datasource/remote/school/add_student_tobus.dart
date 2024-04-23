import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AddStudentToBusSchoolData {
  Crud crud;

  AddStudentToBusSchoolData(this.crud);

  getStudentData({int? schoolId,int? status,int? active}) async {
    var response = await crud.postData(linkUrl:AppLink.viewStudent,data:{
      "schoolId":schoolId.toString(),
      "status":status.toString(),
      "active":active.toString(),

    });
    return response.fold((l) => l, (r) => r);
  }
  addStudentToBusData({int? busId,int? studentId,int? status}) async {
    var response = await crud.postData(linkUrl:AppLink.addStudentToBusSchool,data:{
      "busId":busId.toString(),
      "studentId":studentId.toString(),
      "status":status.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  viewBusData({int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.viewBusSchool,data:{
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
