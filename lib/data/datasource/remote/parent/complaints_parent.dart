
import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class ComplaintsParentData {
  Crud crud;

  ComplaintsParentData(this.crud);
  getDataDriver({var schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.showBusParent,data:{
      "schoolId":schoolId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  addComplaintsData({var busId,int? comFrom,int? comTo,String? comText,int? parentId,String? userName,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.addComplaintParent,data:{
      "comFrom":comFrom.toString(),
      "comTo":comTo.toString(),
      "comText":comText.toString(),
      "parentId":parentId.toString(),
      "userName":userName.toString(),
      "schoolId":schoolId.toString(),
      "busId":busId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getComplaint({int? parentId}) async {
    var response = await crud.postData(linkUrl:AppLink.showComplaintsParent,data:{
      "parentId":parentId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteComplaint({int? complaintId,int? parentId}) async {
    var response = await crud.postData(linkUrl:AppLink.deleteComplaintsParent,data:{
      "parentId":parentId.toString(),
      "complaintId":complaintId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
