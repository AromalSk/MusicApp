

import 'package:hive_flutter/hive_flutter.dart';
part 'mostplayed.g.dart';
@HiveType(typeId:5 )
class MostPlayed extends HiveObject{
  @HiveField(0)
int songId;
@HiveField(1)
String songName;
@HiveField(2)
int? count=0;
@HiveField(3)
String songUrl;
@HiveField(4)
String artist;
@HiveField(5)
int duration;
MostPlayed({required this.songId,required this.artist,required this.songName,required this.songUrl,required this.duration,this.count});
}

late Box<MostPlayed> mostPlayedDb;
openMostlyPlayed()async
{
  mostPlayedDb=await Hive.openBox<MostPlayed>('most_played_db');
}

addMostPlayedSong(MostPlayed song)async
{
  List<MostPlayed> mostPlayedList=mostPlayedDb.values.toList();
  if(mostPlayedList.where((element) => element.songName==song.songName).isEmpty){
    mostPlayedDb.put(song.songId,song);
    
    }
  //   else { 
  //   int index =
  //       mostPlayedList.indexWhere((element) => element.songName == song.songName);
  //    await mostPlayedDb.deleteAt(index);
  //   await mostPlayedDb.put(index, song);
  // }
  // int count = song.count ?? 0;
  // song.count = count + 1;
    else{
      MostPlayed? s=mostPlayedDb.get(song.songId);
      int cnt=s?.count??0;
      song.count=cnt+1;
     // int index=mostPlayedList.indexWhere((element) => element.songName==song.songName);
      // mostPlayedDb.put(index, song);
     //song.count=count++;
    // await mostPlayedDb.deleteAt(index);
     await mostPlayedDb.put(song.songId , song);
     
    }
}

 List<MostPlayed> sortMostlyPlayed(){
List<MostPlayed> sortList=[];

sortList=mostPlayedDb.values.toList();
 sortList.sort((a, b) => (b.count ?? 0).compareTo(a.count ?? 0));
 
  List<MostPlayed> mostPlayedSortList=[];
 for (var element in sortList) {
  if (element.count != null) {
     if(element.count !> 3){
    mostPlayedSortList.add(element);
  }else{
    return mostPlayedSortList;
  }
  }
 
   
 }
 return mostPlayedSortList;
//mostPlayedSortList!.sort((a, b) => (b.count ?? 0).compareTo(a.count ?? 0));
}
