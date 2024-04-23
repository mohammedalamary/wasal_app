import 'package:wasl/core/constant/applink.dart';
import 'package:wasl/core/class/crud.dart';

class TestData{
  Crud crud;
  TestData(this.crud);

  getData({String?  mobile,pass})async{
    var response = await crud.postData(linkUrl:AppLink.test,data:{
      "UserName":mobile.toString(),
      "Passowrd":pass.trim().toString(),
    });
   return response.fold((l) => l, (r) => r);
  }
}