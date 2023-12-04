// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_project/app/modules/login_screen/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/modules/home_screen/home_page.dart';
import 'app/modules/post_details/post_page.dart';
import 'app/modules/splash_screen/splash_page.dart';
import 'app/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  runApp(MyApp());
}

Future<void> initSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  Get.put(AuthService(), permanent: true);
  Get.find<AuthService>().isLoggedIn.value = isLoggedIn;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Get.find<AuthService>().isLoggedIn.value ? HomePage() :SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthService(), permanent: true);
      }),
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/post', page: () => PostPage()),
      ],
    );
  }
}
