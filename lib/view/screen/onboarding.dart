import 'package:wasl/controller/onboarding_controller.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:wasl/view/widget/onboarding/custombutton.dart';
import 'package:wasl/view/widget/onboarding/customslider.dart';
import 'package:wasl/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnBoarding extends StatelessWidget {
   OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  CustomDotSliderOnBoarding(),
                  Spacer(flex: 2),
                  CustomButtonOnBoarding(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
