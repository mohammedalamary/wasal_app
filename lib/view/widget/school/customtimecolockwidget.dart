import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/custom_text.dart';

class CustomTimeColockWidget extends StatelessWidget {
  const CustomTimeColockWidget({super.key,  this.selectTime , this.onTap, this.title});
final  String? selectTime ;
final  String? title ;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0,vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: title.toString()),
          Obx(() => GestureDetector(
              onTap:onTap ,
              child: Container(
                  padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                      color: Colors.grey.shade300
                  ),
                  child: Text( selectTime.toString()??"")))),
        ],

      ),
    );
  }
}
