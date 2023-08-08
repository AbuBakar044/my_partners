import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'friend_model.g.dart';


@HiveType(typeId: 0)
class FriendModel {

  @HiveField(0)
  Uint8List? friendImage;

  @HiveField(1)
  String? friendName;

  @HiveField(2)
  String? friendNumber;

  @HiveField(3)
  String? desc;

  FriendModel(
    this.friendImage,
    this.friendName,
    this.friendNumber,
    this.desc,
  );
}
