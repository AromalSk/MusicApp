// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project_main/model/model.dart';
// part 'mostlyplayed.g.dart';
// @HiveType(typeId: 5)
// class MostlyPlayed {
//   @HiveField(0)
//   String songname;
//   @HiveField(1)
//   String artist;
//   @HiveField(2)
//   int duration;
//   @HiveField(3)
//   int id; 
//   @HiveField(4)
//   String songurl;
//   @HiveField(5)
//   int? count;

//   MostlyPlayed({required this.songname,required this.artist,required this.duration,required this.id,required this.songurl,this.count});
  
// }


// late Box<MostlyPlayed> mostlyplayedDB;
// openMostlyPlayed()async{
//   mostlyplayedDB = await Hive.openBox<MostlyPlayed>('mostly-played');
// }
// // updatemostlyplayedcount(MostlyPlayed value,int index){
// //   int count = value.count!;
// //   value.count = count+1;
// //   mostlyplayedDB.put(index, value);
// // }

// updatempcount(MostlyPlayed data) async {
//   List<MostlyPlayed> templist = mostlyplayedDB.values.toList();
//   bool isallready =
//       templist.where((element) => element.songname == data.songname).isEmpty;
//   if (isallready == true) {
//     await mostlyplayedDB.add(data);
//   } else {
//     int index =
//         templist.indexWhere((element) => element.songname == data.songname);
//     // await mostlyplayedDB.deleteAt(index);
//     await mostlyplayedDB.put(index, data);
//   }
//   int count = data.count ?? 0;
//   data.count = count + 1;
// }

// List<MostlyPlayed> addtolist() {
//   List<MostlyPlayed> mostPlayedList = [];
//   for (var item in mostlyplayedDB.values) {
//     if (item.count! > 4) {
//       mostPlayedList = mostlyplayedDB.values.toList();
//     }
//   }
//   mostPlayedList.sort((a, b) => a.count!.compareTo(b.count!));
//   mostPlayedList = mostPlayedList.reversed.toList();
//   List<MostlyPlayed> templist = [];
//   for (var item in mostPlayedList) {
//     if (item.count! > 4) {
//       templist.add(item);
//     }
//   }
//   return templist;
// }


// converttolist(List<MostlyPlayed> tolist, List<SongDetails> favl) {
//   for (var item in tolist) {
//     favl.add(SongDetails(
//         name: item.songname,
//         artist: item.artist,
//         duration: item.duration,
//         id: item.id,
//         songUrl: item.songurl));
//   }
//   return favl;
// }
