import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../global/custom_text.dart';

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget({super.key, this.title, this.icon, this.onTap});
  final String? title;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color:Colors.white ,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color:  AppColor.greyLess, //color of shadow
              spreadRadius: 5, //spread radius
              offset: const Offset(0.0, 3.0),
              blurRadius: 6.0, // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Row(
          children: [
            // Image.asset(image.toString(),width: 30,),
            Container(
                width: 40,
                height: 40,
                decoration:   BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.primaryColor,
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                      colors: [
                        // AppColor.primaryColor,
                        Color(0xffFFFBA4),
                        Color(0xffE6CEAC),
                        // Color(0xff4DB9A7),
                        // Colors.deepOrange[500],
                        // Colors.deepOrange[500],
                      ],
                      stops: [
                        // 0.1,
                        0.3,
                        0.9,
                      ]),
                ),
                child: Icon(icon,size: 28,)),
            const SizedBox(width: 16,),
            CustomText(text:title),
            const SizedBox(width: 8,),
            // Text(title.toString(),style: TextStyle(color: Colors.black87,fontFamily: "Cairo"),)
          ],
        ),
      ),
    );
  }
}
