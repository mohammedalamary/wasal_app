import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class UpdateAccountDriverData {
  Crud crud;

  UpdateAccountDriverData(this.crud);

  postData({String? pass,String? email,String? name,int? driverId}) async {
    var response = await crud.postData(linkUrl:AppLink.updateAccountDriver,data:{
      "email":email,
      "password":pass,
      "name":name,
      "driverId":driverId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
