import 'package:wasl/core/constant/imagesasset.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.onBoardingImageTwo,
      height: 150,
    );
  }
}
