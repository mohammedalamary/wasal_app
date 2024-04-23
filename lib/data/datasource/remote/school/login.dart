import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class LoginSchoolData {
  Crud crud;

  LoginSchoolData(this.crud);

  postData({String? pass,String? email,int? typeUser}) async {
    var response = await crud.postData(linkUrl:AppLink.loginSchool,data:{
      "email":email,
      "password":pass,
      "typeUser":typeUser.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
