import 'package:wasl/core/constant/imagesasset.dart';
import 'package:wasl/data/model/onboarding.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "ابد",
      body: "يمكنك متابعة اولادك في التعليم الدراسي",
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "الطالب",
      body: "يمكنك رؤية مسار رحلتك",
    image: AppImageAsset.onBoardingImageTwo
  ),
  OnBoardingModel(
      title: "السائق",
      body: "تستيطع معرفة معرفة موقع كل طالب ومعرفة الطلاب الدين يمكنه الدوام بنفس اليوم",
      image: AppImageAsset.onBoardingImageThree),
  OnBoardingModel(
      title: "المدرسة",
      body: "ادراة التوصيل للطلاب وتتبع كل حافلة والاطلاع على الشكاوى",
      image: AppImageAsset.onBoardingImageThree),
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body:
  //         "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
  //     image: AppImageAsset.onBoardingImageFour),
];
