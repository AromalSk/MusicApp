

import 'package:hive_flutter/hive_flutter.dart';
part 'recentlyplayed.g.dart';
@HiveType(typeId: 4)
class RecentlyPlayed {
  @HiveField(0)
  String? songname;
   @HiveField(1)
  String? artist;
   @HiveField(2)
  int ? duration;
   @HiveField(3)
  String? songurl;
   @HiveField(4)
  int ? id;

RecentlyPlayed({required this.songname,required this.artist,required this.duration,required this.songurl, required this.id});
}

late Box<RecentlyPlayed> recentlyPlayedDB;
openRecentlyPlayedDB ()async {
  recentlyPlayedDB = await Hive.openBox<RecentlyPlayed>('recently_played');
}

updatedRecentlyPlayed(RecentlyPlayed value) {
  
  List<RecentlyPlayed> list = recentlyPlayedDB.values.toList();
  bool isAlready = list.where((element) => element.songname == value.songname).isEmpty;

  if (isAlready) {
    recentlyPlayedDB.add(value);
  }else{
    int index = list.indexWhere((element) => element.songname == value.songname);
    recentlyPlayedDB.deleteAt(index);
    recentlyPlayedDB.add(value);
  }
}