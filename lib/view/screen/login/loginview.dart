import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:wasl/core/constant/routes.dart';
import '../../../controller/school/auth/login_school_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/validinput.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/global/custombutton.dart';
class LoginViewScreen extends StatelessWidget {
   LoginViewScreen({super.key});
final controller =Get.put(LoginSchoolController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            // alignment: AlignmentDirectional.bottomCenter,
            clipBehavior:  Clip.none,
            children: [
              Container(
                height: Get.height,
                decoration:   const BoxDecoration(
                  // borderRadius: BorderRadius.circular(8),
                  color: AppColor.primaryColor,
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                      colors: [
                        // AppColor.primaryColor,
                        Color(0xffF7CA31),
                        Color(0xffF8CA2E),
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
              ),

              Positioned(
                top: 200,
                child: Container(

                  width: Get.width,
                  height: Get.height,

                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius:  const BorderRadius.only(topRight: Radius.circular( 42),topLeft: Radius.circular( 64)),
                    boxShadow: [
                      BoxShadow(
                          color: Get.theme.focusColor.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 5)),
                    ],
                  ),
                  child: Form(
                    key: controller.formState,
                    child: SingleChildScrollView(
                      child: Column(
                        children:  [
                          const SizedBox(height: 62,),

                           CustomTextFormField(
                            iconData: Icons.lock_clock_outlined,
                            labelText: 'البريد الالكتروني',
                            hintText: 'ادخل البريد الالكتروني',
                            controller: controller.email,
                            validator: (val){
                              return validateInput(val: val,max: 20,min: 3);
                            },
                          ),

                           Obx(()=>
                               CustomTextFormField(
                               obscureText: controller.obscureText.value,
                               onTapIcon: (){
                                 controller.obscureText.value =! controller.obscureText.value;
                               },
                               controller: controller.password,
                              iconData: controller.obscureText.value?Icons.visibility_off:Icons.visibility,
                              labelText: ' كلمة السر',
                              hintText: 'ادخل  كلمة السر',
                              validator: (val){
                                return validateInput(val: val,max: 20,min: 3);
                              },
                                                   ),
                           ),

                          const SizedBox(height: 32,),
                          Obx(
                            ()=> Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Expanded(

                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 0),
                                  padding: const EdgeInsets.symmetric(horizontal: 1.0),

                                  child: Wrap(
                                    children: [
                                      RadioGroup<String>.builder(
                                        direction: Axis.horizontal,
                                        //horizontalAlignment:MainAxisAlignment.spaceAround,
                                        // activeColor: GlobalData.colorCustom,
                                        groupValue: controller.selectedUserId.value,
                                        onChanged: (val) {
                                          controller.selectedUserId.value = val.toString();
                                          print("val ------------$val");
                                        },
                                        itemBuilder: (item) => RadioButtonBuilder(
                                          item,
                                        ),
                                        items: controller.typeUser, horizontalAlignment: MainAxisAlignment.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32,),

                          GetBuilder<LoginSchoolController>(builder: (controller)=>
                          HandlingDataRequest(statusRequest: controller.statusRequest!,widget:
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(horizontal: 22),
                            child: CustomButton(text: " تسجيل",onPressed: (){
                              // Get.toNamed(AppRoutes.homeStudentNavigation);
                              controller.loginPost();
                            }),
                          ),)),

                          const SizedBox(height: 32,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: Row(
                              children: [
                                Text("ليس لدي حساب",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                Text("  انشاء حساب ك",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColor.primaryColor)),
                              ],
                            ),
                          ),
                          CustomButton(text: " انشاء حساب مدرسة",onPressed: (){
                            Get.toNamed(AppRoutes.signUpSchoolView);
                          }),
                          CustomButton(text: " انشاء حساب ولي امر",onPressed: (){
                            // Get.to(OurContactSchool());
                            // Get.to(AddStudentToBus());
                            Get.toNamed(AppRoutes.signUpParentView);
                            // Get.to(JoinStudent/ParentView());

                          }),
                          // CustomButton(text: " انشاء حساب ر",onPressed: (){
                          //   // Get.to(OurContactSchool());
                          //   // Get.to(AddStudentToBus());
                          //   Get.toNamed(AppRoutes.complaintsShowDriver);
                          //   // Get.to(JoinStudent/ParentView());
                          //
                          // }),
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
