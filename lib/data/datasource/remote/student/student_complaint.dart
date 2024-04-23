import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class ComplaintsStudentData {
  Crud crud;

  ComplaintsStudentData(this.crud);
  //
  // getComplaintData({int? schoolId, int? driverId}) async {
  //   var response = await crud.postData(
  //       linkUrl: AppLink.getComplaintDriver, data: {
  //     "driverId": driverId.toString(),
  //     "schoolId": schoolId.toString(),
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
  // replayComplaint({int? driverId,int? complaintId,String? replayComp}) async {
  //   var response = await crud.postData(linkUrl:AppLink.replayComplaintDriver,data:{
  //     "driverId":driverId.toString(),
  //     "complaintId":complaintId.toString(),
  //     "replayComplaint":replayComp,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
  addComplaintsData({int? comFrom,int? comTo,String? comText,int? studentId,String? userName,int? schoolId,var busId}) async {
    var response = await crud.postData(linkUrl:AppLink.addComplaintStudent,data:{
      "comFrom":comFrom.toString(),
      "comTo":comTo.toString(),
      "comText":comText.toString(),
      "studentId":studentId.toString(),
      "userName":userName.toString(),
      "schoolId":schoolId.toString(),
      "busId":busId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  getComplaintsData({int? studentId,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.showComplaintStudent,data:{
      "schoolId":schoolId.toString(),
      "studentId":studentId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteComplaintsData({int? studentId,int? complaintId}) async {
    var response = await crud.postData(linkUrl:AppLink.deleteComplaintStudent,data:{
      "complaintId":complaintId.toString(),
      "studentId":studentId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
