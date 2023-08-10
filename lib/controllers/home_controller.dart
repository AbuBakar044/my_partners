import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:my_partners/models/friend_model.dart';
import 'package:my_partners/views/screens/add_friends_screen.dart';

class HomeController extends GetxController {
  void goToAddFriendScreen() {
    Get.to(
      () => AddFriendsScreen(),
    );
  }

  
}
