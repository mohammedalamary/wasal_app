import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasl/binding/intialbinding.dart';
import 'package:wasl/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
late  SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages:routes,
      locale: const Locale("ar"),
      initialBinding:InitialBinding(),
      // home: const Language(),
      // initialRoute: AppRoutes.language,
    );
  }
}
