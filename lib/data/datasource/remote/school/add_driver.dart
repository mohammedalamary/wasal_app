import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AddDriverData {
  Crud crud;

  AddDriverData(this.crud);

  postData({String? userName,String? neighbourhood,String? pass,String? email,
    String? phone,String? identity,var schoolId,int? lat,int? long,String? name,String? busNumber}) async {
    var response = await crud.postData(linkUrl:AppLink.addDriver,data:{
      "schoolId":schoolId,
      "name":name,
      "phone":phone,
      "identity":identity,
      "email":email,
      "neighbourhood":neighbourhood,
      "userName":userName,
      "busNumber":busNumber.toString(),
      "password":pass,
      "latitude":lat.toString(),
      "longitude":long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
