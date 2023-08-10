import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_partners/controllers/home_controller.dart';
import '../../models/friend_model.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FriendModel> friendList = [];
  Box<FriendModel>? friendBox;

  @override
  void initState() {
    friendBox = Hive.box<FriendModel>('friends');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
        centerTitle: true,
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeCtrl.goToAddFriendScreen();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: friendBox!.listenable(),
          builder: (context, _, __) {
            friendList = friendBox!.values.toList().cast<FriendModel>();

            return friendList.isEmpty
                ? Center(
                    child: Text('You do not have any saved friends'),
                  )
                : ListView.builder(
                    itemCount: friendList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.blue,
                          leading: CircleAvatar(
                            backgroundImage:
                                MemoryImage(friendList[index].friendImage!),
                          ),
                          title: Text(friendList[index].friendName!),
                          subtitle: Text(friendList[index].friendNumber!),
                          trailing: IconButton(
                            onPressed: () {
                              deleteFriend(index);
                            },
                            icon: Icon(
                              Icons.delete,
                            ),
                          ),
                        ),
                      );
                    });
          }),
    );
  }

  Future<void> deleteFriend(int index) async {
    friendBox!.deleteAt(index);
    friendList.removeAt(index);
    setState(() {});
  }
}
