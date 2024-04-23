import 'package:flutter/material.dart';
import 'package:wasl/core/function/validinput.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import 'package:get/get.dart';
import '../../../controller/driver/add_complaint_driver_controller.dart';
import '../../../core/class/handlingdataview.dart';
class AddComplaintsDriverView extends StatelessWidget {
  AddComplaintsDriverView({super.key});
  final controller = Get.put(AddComplaintsDriverController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 32
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Form(
        key: controller.formState,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 30,),
            CustomTextFormField(
              controller: controller.complaintsText,
              labelText: "اكتب الشكوئ",
              hintText: "ادخل الشكوئ",
              maxLines: 5,
              validator: (val){
                return validateInput(min: 6,max: 100,val:val);
              },
            ),


            const SizedBox(height: 16,),
            GetBuilder<AddComplaintsDriverController>(builder: (controller)=>HandlingDataRequest(
              statusRequest: controller.statusRequestAddComp!,
              widget: CustomButton(onPressed: (){
                controller.addComplaint();
              },text: "ارسال الشكوئ"),)),


          ],
        ),
      ),
    );
  }
}
