import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wasl/core/constant/imagesasset.dart';

import '../../view/widget/global/custom_text.dart';
import '../../view/widget/global/custombutton.dart';

class CustomDialogWidget {
  String? message;

  // String? myTitle;
  bool? isDismissible;
  int? typeWidget;
  int? typeImage;
  void Function()? onOky;
  CustomDialogWidget(
      {this.isDismissible = false,this.typeWidget=0,this.onOky,  this.message,this.typeImage=0});

  dialog() =>
      Get.defaultDialog(
        radius: 12,
        titleStyle: const TextStyle(fontSize: 0),
        contentPadding: const EdgeInsets.only(
            right: 8, left: 8, bottom: 0, top: 0),
        content: Container(
          width: Get.width,
          child: Column(
            children: [

              Lottie.asset(
                typeImage==0? AppImageAsset.successDialog:AppImageAsset.errorDialog,
                height: 60,
                width: 60,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomText(text: message, textColor: Colors.black),
              const SizedBox(
                height: 12,
              ),
              typeWidget==0?
              CustomButton(
                text: "موافق",
                onPressed: () {
                  Get.back();
                },
              ):Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: CustomButton(text: "موافق",onPressed:onOky,)),
                  Expanded(
                    child: CustomButton(
                      text: "الغاء",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        title: "",

        backgroundColor:Colors.white,
        // middleText: myTitle??"",
        // middleTextStyle: const TextStyle(color: Colors.black)
        barrierDismissible: isDismissible ?? true,

      );
}
