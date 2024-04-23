import 'package:wasl/controller/onboarding_controller.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 6),
        child:  Text("استمر"),
      ),
    );
  }
}
