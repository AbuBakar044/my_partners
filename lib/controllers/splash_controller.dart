import 'package:get/get.dart';
import 'package:my_partners/views/screens/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => const HomeScreen(),);
    });
    super.onInit();
  }
}
