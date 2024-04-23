import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../core/constant/custom_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Color? fillColor;
  final bool? filled;
  final bool? enabled;
  final int? maxLines;
  final IconData? iconData;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTapIcon;
  final bool? obscureText;
  final bool? isNumber;
  final int? showIcon;

  const CustomTextFormField(
      {Key? key,
       this.labelText,
       this.hintText,
       this.iconData,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.onTapIcon,
      this.isNumber=false, this.showIcon=1, this.maxLines=1, this.fillColor, this.filled=false, this.enabled=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: TextFormField(
        obscureText: obscureText!,
        validator: validator,

        keyboardType: isNumber!?const TextInputType.numberWithOptions(decimal: true):TextInputType.text,
        controller: controller,
        enabled: enabled,

        decoration: InputDecoration(

          // fillColor: fillColor??AppColor.greyLess,
          fillColor: fillColor??const Color(0xffE5E4E9),
            filled: filled,
            hintText: hintText,
            hintStyle: CustomStyle(sizeFont: 14).style1(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon:showIcon==1? InkWell(onTap: onTapIcon, child: Icon(iconData)):const SizedBox(),
            label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: CustomText(text:labelText??"")),),
        maxLines: maxLines,
      ),
    );
  }
}
