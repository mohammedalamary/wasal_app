import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'custom_text.dart';

class CustomLocationWidget extends StatelessWidget {
  const CustomLocationWidget({super.key, this.onTap});
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        // height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.grey,width: 1,)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "اضافة الموقع"),
            const Icon(Icons.location_on_outlined)
          ],
        ),
      ),
    );
  }
}
