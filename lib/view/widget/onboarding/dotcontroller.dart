import 'package:wasl/controller/onboarding_controller.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:wasl/data/datasource/satic/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotSliderOnBoarding extends StatelessWidget {
  const CustomDotSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller)=>
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ...List.generate(
            onBoardingList.length,
                (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              height: 6,
              width: controller.currentPage ==index?20:6,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            )),
      ],
    ));
  }
}
