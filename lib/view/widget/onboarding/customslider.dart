import 'package:wasl/controller/onboarding_controller.dart';
import 'package:wasl/data/datasource/satic/static.dart';
import 'package:flutter/material.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index){
        controller.onPageChanged(index);
        print("index : $index");
      },
        itemCount: onBoardingList.length,
        itemBuilder: (BuildContext context, index) => Column(
              children: [
                Text(
                  onBoardingList[index].title!,
                  style:const TextStyle(
                      height: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.black),
                ),
                const SizedBox(height: 60,),
                Image.asset(
                  onBoardingList[index].image.toString(),
                  // width: 200,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[index].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: 1.5,
                        color: AppColor.grey),
                  ),
                )
              ],
            ));
  }
}
