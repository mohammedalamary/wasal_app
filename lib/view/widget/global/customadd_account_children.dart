import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class CustomAddAccountChildren extends StatelessWidget {
  const CustomAddAccountChildren({super.key,this.title,this.onTap,this.icon});
  final String? title;
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CustomText(text: title??"",textColor: AppColor.black,),

          const SizedBox(width: 12,),
           Icon(icon??Icons.person_add_alt_1_outlined,color: AppColor.grey,),
          const Spacer(),
          GestureDetector(
            onTap:onTap,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              width: 80,
              // padding: EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppColor.greyLess,
                borderRadius: BorderRadius.circular(32),
              ),
              child:  Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
