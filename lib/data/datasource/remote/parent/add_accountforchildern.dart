import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AddAccountForChildrenData {
  Crud crud;

  AddAccountForChildrenData(this.crud);

  getChildrenData({int? parentId}) async {
    var response = await crud.postData(linkUrl:AppLink.getChildrenParent,data:{
      "parentId":parentId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  addAccountData({int? parentId,int? studentId,String? studentName,String? studentPassword,int? allowed,String? email,}) async {
    var response = await crud.postData(linkUrl:AppLink.approveAccountChildren,data:{
      "studentId":studentId.toString(),
      "studentName":studentName.toString(),
      "studentPassword":studentPassword,
      "allowed":allowed.toString(),
      "parentId":parentId.toString(),
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
  preparationStudentData({int? studentId,String? date,int? preparation}) async {
    var response = await crud.postData(linkUrl:AppLink.preparationStudent,data:{
      "studentId":studentId.toString(),
      "date":date.toString(),
      "preparation":preparation.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
