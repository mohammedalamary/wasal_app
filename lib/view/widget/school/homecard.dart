import 'package:flutter/material.dart';


class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key, required this.backgroundColor, required this.title, this.textColor, this.onTap});
final int? backgroundColor;
final String? title;
final int? textColor;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color:Color(backgroundColor!),
          borderRadius: BorderRadius.circular(12),
          // #C9E2CC
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 22,top: 12,bottom: 12),
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.arrow_forward_outlined)),
            Text(title??"",style:  const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
