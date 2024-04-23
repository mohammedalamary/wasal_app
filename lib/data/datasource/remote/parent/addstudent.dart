import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AddStudentParentData {
  Crud crud;

  AddStudentParentData(this.crud);

  getDataSchool({String? pass,String? email,int? typeUser}) async {
    var response = await crud.postData(linkUrl:AppLink.getDataAllSchool,data:{
    });
    return response.fold((l) => l, (r) => r);
  }

  addStudentData({int? parentId,int? schoolId,String? parentName,String? parentIdentity,String? parentPhone,String? studentName,
  int? studentIdentity,String? birthData,int? latitude,int? longitude,int? guarantee,String? level,String? grader }) async {
    var response = await crud.postData(linkUrl:AppLink.addStudentParent,data:{
      "parentId":parentId.toString(),
      "parentName":parentName.toString(),
      "parentidentity":parentIdentity.toString(),
      "parentPhone":parentPhone.toString(),
      "studentName":studentName.toString(),
      "studentidentity":studentIdentity.toString(),
      "birthData":birthData,
      "latitude":latitude.toString(),
      "longitude":longitude.toString(),
      "schoolId":schoolId.toString(),
      "St_guarantee":guarantee.toString(),
      "level":level.toString(),
      "St_grader":grader.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
