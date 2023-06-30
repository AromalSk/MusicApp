

import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/model/recentlyplayed/recentlyplayed.dart';

late Box<RecentlyPlayed> recentDb;
openDB()async{
  recentDb = await Hive.openBox<RecentlyPlayed>('recent');
}

updateRecent(RecentlyPlayed values){
  List<RecentlyPlayed> list = recentDb.values.toList();
  bool already = list.where((element) => element.songname == values.songname).isEmpty;
  if (already) {
    recentDb.add(values);
  }else{
   int  index = list.indexWhere((element) => element.songname == values.songname);
   recentDb.deleteAt(index);
   recentDb.add(values);
  }
}