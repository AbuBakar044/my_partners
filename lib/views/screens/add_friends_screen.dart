import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_partners/controllers/add_friends_controller.dart';

import '../widgets/custom_form_field.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  Uint8List? userImage;
  @override
  Widget build(BuildContext context) {
    final addFriendCtrl = Get.put<AddFriendsController>(AddFriendsController());
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showSheet();
                },
                child: CircleAvatar(
                  radius: 55.0,
                  backgroundImage: userImage == null
                      ? const AssetImage('assets/images/friends.png')
                      : MemoryImage(userImage!) as ImageProvider,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomFormField(
                hint: 'Add Name',
                controller: addFriendCtrl.nameCtrl,
                validator: (val) {
                  if (val!.isEmpty) {
                    return '^please add name';
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomFormField(
                hint: 'Add Number',
                controller: addFriendCtrl.mobileCtrl,
                validator: (val) {
                  if (val!.isEmpty) {
                    return '^please add number';
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomFormField(
                hint: 'Add Description',
                controller: addFriendCtrl.descCtrl,
                maxLines: 10,
                validator: (val) {
                  if (val!.isEmpty) {
                    return '^please add description';
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(
                      Get.width / 2,
                      50.0,
                    ),
                  ),
                ),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showSheet() async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: Get.height / 4,
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Pick Image From',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        pickeImageSource(ImageSource.camera).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: Column(
                        children: [
                          const Text('Camera'),
                          Image.asset(
                            'assets/images/camera.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    InkWell(
                      onTap: () {
                        pickeImageSource(ImageSource.gallery).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: Column(
                        children: [
                          const Text('Gallery'),
                          Image.asset(
                            'assets/images/gallery.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<void> pickeImageSource(ImageSource source) async {
    XFile? tempImage = await ImagePicker().pickImage(source: source);

    if (tempImage == null) {
      return;
    } else {
      userImage = await tempImage.readAsBytes();
      setState(() {});
    }
  }
}
