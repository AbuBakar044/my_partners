import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_partners/controllers/splash_controller.dart';
import '../../constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(kFriendsLogo),
              const Text('My partners'),
            ],
          ),
        ),
      ),
    );
  }
}
