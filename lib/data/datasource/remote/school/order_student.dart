import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class OrderStudentSchoolData {
  Crud crud;

  OrderStudentSchoolData(this.crud);

  getStudentData({int? schoolId,int? status,int? active}) async {
    var response = await crud.postData(linkUrl:AppLink.viewStudent,data:{
      "schoolId":schoolId.toString(),
      "status":status.toString(),
      "active":active.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  checkApproveStudentData({int? schoolId,int? studentId,int? studentActiveAccount,int? allowed,int? status}) async {
    var response = await crud.postData(linkUrl:AppLink.approveStudent,data:{
      "studentId":studentId.toString(),
      "schoolId":schoolId.toString(),
      "studentActive":studentActiveAccount.toString(),
      "allowed":allowed.toString(),
      "status":status.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

}
