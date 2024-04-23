import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class UpdateAccountSchoolData {
  Crud crud;

  UpdateAccountSchoolData(this.crud);

  postData({String? pass,String? email,String? name,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.updateAccountSchool,data:{
      "email":email,
      "password":pass,
      "name":name,
      "schoolId":schoolId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
