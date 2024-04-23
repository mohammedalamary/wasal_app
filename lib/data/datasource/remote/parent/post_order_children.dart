import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class PostOrderChildrenData {
  Crud crud;

  PostOrderChildrenData(this.crud);

  getStudentActiveDat({int? parentId}) async {
    var response = await crud.postData(linkUrl:AppLink.lostChildrenParentActive,data:{
      "parentId":parentId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  getStudentNoActiveDat({int? parentId}) async {
    var response = await crud.postData(linkUrl:AppLink.lostChildrenParentNoActive,data:{
      "parentId":parentId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}