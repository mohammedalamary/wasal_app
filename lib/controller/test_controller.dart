import 'package:wasl/core/class/stausrequest.dart';
import 'package:wasl/core/function/handlingdatacontroller.dart';
import 'package:wasl/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';
class TestController extends GetxController{

  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest? statusRequest;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData()async{
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("=========================== controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="success"){
        data.addAll(response["data"]);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}