import 'package:flutter/material.dart';
import 'package:wasl/core/function/validinput.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custombutton.dart';
import 'package:get/get.dart';
import '../../../controller/driver/add_complaint_driver_controller.dart';
import '../../../controller/parent/add_complaints_parent_controller.dart';
import '../../../controller/student/add_student_complaints.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/custom_text.dart';
class AddComplaintsStudentView extends StatelessWidget {
  AddComplaintsStudentView({super.key});
  final controller = Get.put(AddComplaintsStudentController());

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
            const SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(right: 32.0,bottom: 6),
              child: CustomText(text: "اختار نوع الشكوئ تدهب الى"),
            ),
            const SizedBox(height: 16,),

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
                    items: controller.typeComplaints.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem<String>(
                        value: e.toString(),
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      controller.upDateSelected(val.toString());
                    },
                    value: controller.selectedTypeComplaints.value == ""
                        ? null
                        : controller.selectedTypeComplaints.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),

            GetBuilder<AddComplaintsStudentController>(builder: (controller)=>HandlingDataRequest(
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
