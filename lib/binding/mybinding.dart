import 'package:get/get.dart';

class InitialBindingOld extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpControllerImp(),fenix: true);// هي تغمل كلير للحقول كمان
  }

}