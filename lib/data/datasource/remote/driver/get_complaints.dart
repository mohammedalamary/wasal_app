import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class GetComplaintsDriverData {
  Crud crud;

  GetComplaintsDriverData(this.crud);

  getComplaintData({int? schoolId, int? driverId}) async {
    var response = await crud.postData(
        linkUrl: AppLink.getComplaintDriver, data: {
      "driverId": driverId.toString(),
      "schoolId": schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  replayComplaint({int? driverId,int? complaintId,String? replayComp}) async {
    var response = await crud.postData(linkUrl:AppLink.replayComplaintDriver,data:{
      "driverId":driverId.toString(),
      "complaintId":complaintId.toString(),
      "replayComplaint":replayComp,
    });
    return response.fold((l) => l, (r) => r);
  }


  addComplaintsData({int? comFrom,int? comTo,String? comText,int? driverId,String? userName,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.addComplaintDriver,data:{
      "comFrom":comFrom.toString(),
      "comTo":comTo.toString(),
      "comText":comText.toString(),
      "driverId":driverId.toString(),
      "userName":userName.toString(),
      "schoolId":schoolId.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }


}
