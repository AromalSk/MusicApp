
import 'package:hive_flutter/hive_flutter.dart';
part 'playlist.g.dart';
@HiveType(typeId: 3)
class PlayListModel extends HiveObject{

  @HiveField(0)
  String playlistName;
  @HiveField(1)
  List<int> item = [];


  PlayListModel({required this.playlistName});
}