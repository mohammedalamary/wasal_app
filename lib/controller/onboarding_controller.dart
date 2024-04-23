import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/data/datasource/satic/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wasl/main.dart';



class OnBoardingControllerImp extends GetxController {
  var isChecked = <bool>[false, false, false, false].obs;

  int currentPage = 0;
  late PageController pageController;

  // MyServices myServices = Get.find();
  next() {
    currentPage ++;
    if(currentPage>onBoardingList.length-1){
      sharedPreferences.setString(Global.step, "1");
      Get.offAllNamed(AppRoutes.login);
      print("current page is : $currentPage");
    }else{
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }


  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

}
