import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/imagesasset.dart';
import 'package:wasl/core/constant/routes.dart';

import '../../../core/constant/color.dart';
import '../../widget/global/custombutton.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF4D13F),
        elevation: 0,
      ),
      body: Column(
        children: [

          // SizedBox(height: 16,),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            clipBehavior:  Clip.none,
            children: [
              Container(
                height: 250,
                width: Get.width,
                // padding: EdgeInsets.only(right: 220),

                decoration:  const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(66)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.backgroundColor,
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ],
                ),
                margin: const EdgeInsets.only(bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular( 10)),
                  boxShadow: [
                    BoxShadow(
                        color: Get.theme.focusColor.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 5)),
                  ],
                ),
                child: Image.asset(
                  AppImageAsset.startimage,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 100,
                ),
              ),
            ],
          ),

          const Spacer(flex: 2,),
          Flexible(
            flex: 1,
            child: CustomButton(text: "ابدا ",onPressed: (){
              Get.toNamed(AppRoutes.onBoarding);
            }),
          ),

          const SizedBox(height: 23,),




        ],
      ),
    );
  }
}
