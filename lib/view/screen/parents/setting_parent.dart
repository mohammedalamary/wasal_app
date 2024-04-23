import 'package:flutter/material.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../widget/global/custom_icon_appbar.dart';
import '../../widget/school/widgetprofile.dart';

class SettingParentView extends StatelessWidget {
  const SettingParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.white ,
        leading:const CustomAppBarIcon(),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16,),
          Align(alignment: Alignment.center,child: CustomText(text: "الاعدادات",fontSize: 14,)),
          SizedBox(height: 16,),

          CustomProfileWidget(title: "اللغة",icon: Icons.language,onTap: (){

          },),
          CustomProfileWidget(title: "لوت الخلفية",icon: Icons.color_lens_outlined,onTap: (){

          },),
           CustomButton(text: "معلومات الحساب",color: Color(0xffDFD1C5),onPressed: (){

          }),

          CustomButton(text: "التقييم والملاحظات الحساب",color: Color(0xffDFD1C5),onPressed: (){

          },)
        ],
      ),
    );
  }
}
