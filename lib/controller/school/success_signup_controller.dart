import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class SuccessSignUpController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}