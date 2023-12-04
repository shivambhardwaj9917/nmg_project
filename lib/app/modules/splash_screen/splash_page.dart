import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_screen/login_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can customize your splash screen UI here

    // Simulate some initialization work (e.g., fetching data, setting up services)
    Future.delayed(
      const Duration(seconds: 3),
          () {
        // Navigate to the next screen after 2 seconds
        Get.to(LoginScreen());
      },
    );

    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/nmg_logo.png',),
              fit: BoxFit.cover,
            ), //DecorationImage
          ), //BoxDecoration
        ),
      ),
    );
  }
}
