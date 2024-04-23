import 'package:wasl/controller/onboarding_controller.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    this.onPressed,
    this.text, this.color,
  });
final void Function()? onPressed;
final String? text;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: MaterialButton(
        onPressed: onPressed,
        color: color??AppColor.primaryColor,
        textColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        ),
        child:  CustomText(text: text),
        // Text(text.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
