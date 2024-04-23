import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class UpdateAccountParentData {
  Crud crud;

  UpdateAccountParentData(this.crud);

  postData({String? pass,String? email,String? name,int? parentId}) async {
    var response = await crud.postData(linkUrl:AppLink.updateAccountParent,data:{
      "email":email,
      "password":pass,
      "name":name,
      "parentId":parentId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
