import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class SignUpParentData {
  Crud crud;

  SignUpParentData(this.crud);
  getDataSchool({String? pass,String? email,int? typeUser}) async {
    var response = await crud.postData(linkUrl:AppLink.getDataAllSchool,data:{
    });
    return response.fold((l) => l, (r) => r);
  }
  signUpParentData({String? name,String? pass,int? identity,String? phone,String? email,String? userName,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.signUpParent,data:{
      "name":name,
      "phone":phone,
      "identity":identity.toString(),
      "email":email,
      "userName":userName,
      "password":pass,
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
