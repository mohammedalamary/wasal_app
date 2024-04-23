import 'package:flutter/material.dart';
import 'package:wasl/core/function/validinput.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import 'package:get/get.dart';
import '../../../controller/driver/notification_driver.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/custom_text.dart';
class AddNotificationDriver extends StatelessWidget {
  AddNotificationDriver({super.key});
  final controller = Get.put(NotificationDriverController());

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
          // shrinkWrap: true,
          children: [
            const SizedBox(height: 30,),
            CustomTextFormField(
              controller: controller.notifyText,
              labelText: "اضافة اشعار",
              hintText: "ادخل اضافة اشعار",
              maxLines: 5,
              validator: (val){
                return validateInput(min: 6,max: 100,val:val);
              },
            ),
            const SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(right: 32.0,bottom: 6),
              child: CustomText(text: "اختار نوع الاشعار الى"),
            ),
            Obx(
                  () => Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grey,width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: controller.typeNotification.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      controller.upDateSelected(val.toString());
                    },
                    value: controller.selectedTypeNotification.value == ""
                        ? null
                        : controller.selectedTypeNotification.value,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),

            GetBuilder<NotificationDriverController>(builder: (controller)=>HandlingDataRequest(
              statusRequest: controller.statusRequest!, widget: CustomButton(onPressed: (){
              controller.addNotification();
            },text: "ارسال الاشغار"),)),


          ],
        ),
      ),
    );
  }
}
