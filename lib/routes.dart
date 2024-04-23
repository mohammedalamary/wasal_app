import 'package:wasl/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:wasl/view/screen/driver/add_complaint_driver.dart';
import 'package:wasl/view/screen/driver/add_notification_driver.dart';
import 'package:wasl/view/screen/driver/complaint_show_driver.dart';
import 'package:wasl/view/screen/driver/driver_students.dart';
import 'package:wasl/view/screen/driver/location_driver.dart';
import 'package:wasl/view/screen/driver/navigation_driver.dart';
import 'package:wasl/view/screen/driver/show_notifications_driver.dart';
import 'package:wasl/view/screen/driver/student_go_school_parent.dart';
import 'package:wasl/view/screen/driver/update_account_driver.dart';
import 'package:wasl/view/screen/forget_password.dart';
import 'package:wasl/view/screen/login/loginview.dart';
import 'package:wasl/view/screen/onboarding.dart';
import 'package:wasl/view/screen/parents/List of_children_and_requests_parent.dart';
import 'package:wasl/view/screen/parents/addan_account_forchildren.dart';
import 'package:wasl/view/screen/parents/addcomplaints_parent.dart';
import 'package:wasl/view/screen/parents/attendance_and_departure_parent.dart';
import 'package:wasl/view/screen/parents/home_navigation_parent.dart';
import 'package:wasl/view/screen/parents/join_student_parent.dart';
import 'package:wasl/view/screen/parents/account/update_account_parent.dart';
import 'package:wasl/view/screen/parents/show_complaints_parent.dart';
import 'package:wasl/view/screen/parents/signup_parent.dart';
import 'package:wasl/view/screen/parents/the_journey_parent.dart';
import 'package:wasl/view/screen/schools/add_driver_view.dart';
import 'package:wasl/view/screen/schools/add_notification_school.dart';
import 'package:wasl/view/screen/schools/add_student_to_bus.dart';
import 'package:wasl/view/screen/schools/approv_student.dart';
import 'package:wasl/view/screen/schools/complaint_school.dart';
import 'package:wasl/view/screen/schools/homenavigationschool/home_navigation_school.dart';
import 'package:wasl/view/screen/schools/our_contacts_school.dart';
import 'package:wasl/view/screen/schools/register_attendance.dart';
import 'package:wasl/view/screen/schools/signup_view/signupview.dart';
import 'package:wasl/view/screen/schools/successsignup.dart';
import 'package:wasl/view/screen/startScreem/startscreenview.dart';
import 'package:wasl/view/screen/students/add_complaint.dart';
import 'package:wasl/view/screen/students/attendance_student.dart';
import 'package:wasl/view/screen/students/driver_information_for_the_student.dart';
import 'package:wasl/view/screen/students/navigation/navigation_student.dart';
import 'package:wasl/view/screen/students/show_complaints_student.dart';
import 'package:wasl/view/screen/students/the_journey_student_view.dart';
import 'package:wasl/view/screen/students/update_account_student.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes =[
  GetPage(name:AppRoutes.startScreenView, page:()=> const StartScreenView(),middlewares: [MyMiddleWare()]),
  GetPage(name:AppRoutes.onBoarding, page:()=>  OnBoarding(),),
  // GetPage(name:"/", page:()=> const TestView()),
  // GetPage(name:"/", page:()=> const Test()),
  GetPage(name:AppRoutes.login, page:()=>  LoginViewScreen(),),
  GetPage(name:AppRoutes.successSignUp, page:()=> const SuccessSignUpScreen(),),

  // School
  GetPage(name:AppRoutes.signUpSchoolView, page:()=>  SignUpSchoolView(),),
  GetPage(name:AppRoutes.navigationSchool, page:()=>   NavigationSchool(),),
  GetPage(name:AppRoutes.addDriverView, page:()=>   AddDriverView(),),
  GetPage(name:AppRoutes.registerAttendance, page:()=>   RegisterAttendance(),),
  GetPage(name:AppRoutes.addNotificationSchool, page:()=>   AddNotificationSchool(),),
  GetPage(name:AppRoutes.complaintSchoolView, page:()=>   ComplaintSchoolView(),),
  GetPage(name:AppRoutes.approveStudentSchool, page:()=>   ApproveStudentSchool(),),
  GetPage(name:AppRoutes.addStudentToBus, page:()=>   AddStudentToBus(),),
  GetPage(name:AppRoutes.ourContactSchool, page:()=>   OurContactSchool(),),



  // shared screen all users
  GetPage(name:AppRoutes.forgetPassword, page:()=>   ForgetPassword(),),


  // parent
  GetPage(name:AppRoutes.signUpParentView, page:()=>   SignUpParentView(),),
  GetPage(name:AppRoutes.homeNavigationParent, page:()=>   HomeNavigationParent(),),
  GetPage(name:AppRoutes.homeNavigationParent, page:()=>   HomeNavigationParent(),),
  GetPage(name:AppRoutes.attendanceAndDepartureParent, page:()=>   AttendanceAndDepartureParent(),),
  GetPage(name:AppRoutes.joinStudentParentView, page:()=>   JoinStudentParentView(),),
  GetPage(name:AppRoutes.addAccountForChildrenParent, page:()=>   AddAccountForChildrenParent(),),
  GetPage(name:AppRoutes.listOfPotsAndOrdersParentView, page:()=>   ListOfChildrenAndRequestsParentView(),),
  GetPage(name:AppRoutes.updateAccountParentScreen, page:()=>   UpdateAccountParentScreen(),),
  GetPage(name:AppRoutes.addComplaintsParentView, page:()=>   AddComplaintsParentView(),),
  GetPage(name:AppRoutes.showComplaintsParentView, page:()=>   ShowComplaintsParentView(),),
  GetPage(name:AppRoutes.theJourneyParentView, page:()=>   TheJourneyParentView(),),


  // driver
  GetPage(name:AppRoutes.homeNavigationDriver, page:()=>   HomeNavigationDriver(),),
  GetPage(name:AppRoutes.locationDriverView, page:()=>   LocationDriverView(),),
  GetPage(name:AppRoutes.studentGoToSchoolDriver, page:()=>   StudentGoToSchoolDriver(),),
  GetPage(name:AppRoutes.driverStudent, page:()=>   DriverStudent(),),
  GetPage(name:AppRoutes.complaintsShowDriver, page:()=>   ComplaintsShowDriver(),),
  GetPage(name:AppRoutes.updateAccountDriverScreen, page:()=>   UpdateAccountDriverScreen(),),
  GetPage(name:AppRoutes.addComplaintsDriverView, page:()=>   AddComplaintsDriverView(),),
  GetPage(name:AppRoutes.addNotificationDriver, page:()=>   AddNotificationDriver(),),
  GetPage(name:AppRoutes.showNotificationDriver, page:()=>   ShowNotificationDriver(),),

  //home

// student
  GetPage(name:AppRoutes.homeStudentNavigation, page:()=>  const HomeStudentNavigation(),),
  GetPage(name:AppRoutes.attendanceStudentView, page:()=>   AttendanceStudentView(),),
  GetPage(name:AppRoutes.driverInformationForTheStudent, page:()=>   const DriverInformationForTheStudent(),),
  GetPage(name:AppRoutes.updateAccountStudentScreen, page:()=>   UpdateAccountStudentScreen(),),
  GetPage(name:AppRoutes.addComplaintsStudentView, page:()=>   AddComplaintsStudentView(),),
  GetPage(name:AppRoutes.showComplaintsStudentView, page:()=>   ShowComplaintsStudentView(),),
  GetPage(name:AppRoutes.theJourneyStudentScreen, page:()=>   const TheJourneyStudentScreen(),),




];
