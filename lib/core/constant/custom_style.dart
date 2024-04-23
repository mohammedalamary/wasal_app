import 'package:flutter/material.dart';

class CustomStyle {
  final double? sizeFont;
  final Color? colors;
  final FontWeight? fonWeight;
  final String? fotFamily;

  CustomStyle({
    this.sizeFont,
    this.colors,
    this.fonWeight,
    this.fotFamily = ""});
  // title default

  TextStyle style1() {
    return TextStyle(
        fontSize: sizeFont ?? 16,
        color: colors,
        // color: colors??Colors.black,
        fontWeight: fonWeight,
        // letterSpacing: 1.3,
        fontFamily:"Cairo",);
  }
}
