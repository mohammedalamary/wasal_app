import 'package:flutter/material.dart';

class CustomBuildContainer extends StatelessWidget {
  const CustomBuildContainer({super.key, this.title, this.color, this.onTap});
  final String? title;
  final int? color;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),

        decoration: BoxDecoration(
          color: Color(color!),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 22,top: 12,bottom: 12),
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.arrow_forward_outlined)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title??"",style:  const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            )

          ],
        ),
      ),
    );
  }
}
