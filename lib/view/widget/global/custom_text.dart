import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/custom_style.dart';

class CustomText extends StatelessWidget {
   String ? text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? fotFamily;
  final int? isAlign;
  final int? textMaxLines;
  // final int? isColorText;

   CustomText(
      {Key? key,
      required this.text,
      this.fontSize ,
      this.fontWeight = FontWeight.bold,
      this.fotFamily = "Cairo",  this.textColor, this.isAlign=0, this.textMaxLines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: textMaxLines,
      // textAlign: txtAlign ?? TextAlign.start,
      style: CustomStyle(
        sizeFont: fontSize??12,
        fonWeight: fontWeight??FontWeight.bold,
        colors:textColor??AppColor.black,
        // colors: textColor??AppColor.black,
        fotFamily: fotFamily??"Cairo",

      ).style1(),
    );
  }
}
