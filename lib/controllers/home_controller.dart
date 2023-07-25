import 'package:get/get.dart';
import 'package:my_partners/views/screens/add_friends_screen.dart';

class HomeController extends GetxController {
  void goToAddFriendScreen() {
    Get.to(
      () => AddFriendsScreen(),
    );
  }
}
