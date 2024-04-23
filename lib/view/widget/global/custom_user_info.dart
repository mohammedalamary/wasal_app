import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'custom_text.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key, this.userName, this.typeUser});
  final String? userName;
  final String? typeUser;
  @override
  Widget build(BuildContext context) {
    return    Container(
      margin: const EdgeInsets.symmetric(horizontal: 32,vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey,width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container( padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.grey,width: 2)
            ),child: const Icon(Icons.person_rounded)),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "مرحبا"),
            CustomText(text: "المستخدم $typeUser"),
          ],
        ),
        subtitle:  CustomText(text:userName??""),
      ),
    );
  }
}
