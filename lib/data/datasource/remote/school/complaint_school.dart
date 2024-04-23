import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class ComplaintSchoolData {
  Crud crud;

  ComplaintSchoolData(this.crud);

  getData({int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.complaintSchool,data:{
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  // الرد على شكوئ
  postData({int? schoolId,int? complaintId,String? replayComp}) async {
    var response = await crud.postData(linkUrl:AppLink.replayComplaintSchool,data:{
      "schoolId":schoolId.toString(),
      "complaintId":complaintId.toString(),
      "replayComplaint":replayComp,
    });
    return response.fold((l) => l, (r) => r);
  }
}
