import 'package:get/get.dart';
import 'package:my_partners/views/screens/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(() => const HomeScreen(),);
    });
    super.onInit();
  }
}
