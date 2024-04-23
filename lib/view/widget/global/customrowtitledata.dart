import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'custom_text.dart';

class CustomRowData extends StatelessWidget {
  const CustomRowData({Key? key, this.title, this.body, this.textColor, this.align, this.rightAlign}) : super(key: key);
  final String? title;
  final String? body;
  final Color? textColor;
  final double? align;
  final double? rightAlign;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:align?? 6.0,right: rightAlign??0),
      child: Row(
        children: [
          Expanded(flex: 2,child: CustomText(text: title.toString(),isAlign: 1,textColor: textColor??AppColor.black,)),
          // Spacer(),
          // SizedBox(width: UiHelperSize.w10,),
          Expanded(flex: 3,child: CustomText(text:body.toString(),isAlign: 1,textColor: AppColor.grey,)),
          // Spacer(),
        ],
      ),
    );
  }
}
