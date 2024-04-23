import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class SignUpSchoolData {
  Crud crud;

  SignUpSchoolData(this.crud);

  postData({String? userName,String? pass,String? email,String? phone,String? schoolName,double? lat,double? long,int? timeing}) async {
    var response = await crud.postData(linkUrl:AppLink.signUpSchool,data:{
      "nameSchool":schoolName,
      "phone":phone,
      "timeing":timeing.toString(),
      "email":email,
      "userName":userName,
      "password":pass,
      "latitude":lat.toString(),
      "longitude":long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
