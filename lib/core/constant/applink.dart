class AppLink{
  AppLink._();
  static const String linkServerApi = "http://192.168.137.1/wasal";

  //////////////////////school/////////////////////
static const String signUpSchool = "$linkServerApi/school/auth/signup.php";
static const String loginSchool = "$linkServerApi/school/auth/login.php";
static const String addDriver = "$linkServerApi/school/adddriver.php";
static const String addTime = "$linkServerApi/school/addtime.php";
static const String addNotificationSchool = "$linkServerApi/school/addnotification.php";
static const String showNotifications = "$linkServerApi/school/shownotifaction.php";
static const String complaintSchool = "$linkServerApi/school/comlaintschool.php";
static const String replayComplaintSchool = "$linkServerApi/school/replaycomplaintschool.php";
// static const String addStudentToBusSchool = "$linkServerApi/school/viewstudent.php";
static const String viewStudent = "$linkServerApi/school/viewstudent.php";
static const String addStudentToBusSchool = "$linkServerApi/school/addstudenttobus.php";
static const String approveStudent = "$linkServerApi/school/approvestudent.php";
static const String viewBusSchool = "$linkServerApi/school/viewbusschool.php";
static const String updateAccountSchool = "$linkServerApi/school/updateaccount.php";
static const String ourContactSchool = "$linkServerApi/school/ourcontactsstudentchool.php";

// parent
static const String signUpParent = "$linkServerApi/parent/signupparent.php";
static const String getDataAllSchool = "$linkServerApi/parent/getallschool.php";
static const String addStudentParent = "$linkServerApi/parent/addstudent.php";
static const String getChildrenParent = "$linkServerApi/parent/getstudent.php";
static const String approveAccountChildren = "$linkServerApi/parent/addaccountforchildren.php";
static const String updateAccountParent = "$linkServerApi/parent/updateaccountparent.php";
  static const String lostChildrenParentActive = "$linkServerApi/parent/listchildrenparent.php";
  static const String lostChildrenParentNoActive = "$linkServerApi/parent/getstudentnoactive.php";
  static const String preparationStudent = "$linkServerApi/parent/Preparingstudents.php";
  static const String addComplaintParent = "$linkServerApi/parent/addcomlaintparent.php";
  static const String showComplaintsParent = "$linkServerApi/parent/showcomplaintsparent.php";
  static const String deleteComplaintsParent = "$linkServerApi/parent/deletecomplaintsparent.php";
  static const String showNotificationParent = "$linkServerApi/parent/showNotification.php";
  static const String showBusParent = "$linkServerApi/parent/showBusSchool.php";

  //auth app ...........................
  static const String test = "$linkServerApi/checkloginempattend";

  // driver
  static const String getStudentDriver = "$linkServerApi/driver/getstudent.php";
  static const String studentGoToSchoolDriver = "$linkServerApi/driver/studentgotoschool.php";
  static const String updateAccountDriver = "$linkServerApi/driver/updateaccountdriver.php";
  static const String getComplaintDriver = "$linkServerApi/driver/getcomplaintsdriver.php";
  static const String replayComplaintDriver = "$linkServerApi/driver/replaycomplaintdriver.php";
  static const String addComplaintDriver = "$linkServerApi/driver/addcomplaintdriver.php";
  static const String addNotificationDriver = "$linkServerApi/driver/addnotification.php";
  static const String showNotificationDriver = "$linkServerApi/driver/shownotification.php";

// student
  static const String attendanceStudent = "$linkServerApi/student/attedancestudent.php";
  static const String busInformationStudent = "$linkServerApi/student/getinfodriver.php";
  static const String updateAccountStudent = "$linkServerApi/student/updateAccountStudent.php";
  static const String addComplaintStudent = "$linkServerApi/student/addcomplaint.php";
  static const String showComplaintStudent = "$linkServerApi/student/showComplaintsStudent.php";
  static const String getNotificationStudent = "$linkServerApi/student/showNotification.php";
  static const String deleteComplaintStudent = "$linkServerApi/student/deleteComplaint.php";


}