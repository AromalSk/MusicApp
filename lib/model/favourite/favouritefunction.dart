
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/model/favourite/favourite.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/screens/splash_screen.dart';


 // ignore: non_constant_identifier_names
 ValueNotifier<List<SongDetails>> FavouriteNotifier = ValueNotifier([]);

addToFav(int id) async {
  final favDB = await Hive.openBox<FavoriteSongs>('fav_DB');
  await favDB.put(id, FavoriteSongs(id: id));
  for (var elements in Songall) {
    if (elements.id == id) {
      FavouriteNotifier.value.add(elements);
    }
  }
   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
   FavouriteNotifier.notifyListeners();
}


late Box<FavoriteSongs>favDbObject;
openFav()async{
  favDbObject=await Hive.openBox<FavoriteSongs>('fav_DB');
  }

Future<void> removeFromFav(int id) async {
  final favDB = await Hive.openBox<FavoriteSongs>('fav_DB');
  await favDB.delete(id);
  for (var element in Songall) {
    if (element.id == id) {
      FavouriteNotifier.value.remove(element);
    }
   
  }
 
   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
   FavouriteNotifier.notifyListeners();
}

  getFav()async{
     FavouriteNotifier.value.clear();
  List<FavoriteSongs> favSongCheck = [];
    final favDB = await Hive.openBox<FavoriteSongs>('fav_DB');

    favSongCheck.addAll(favDB.values);
    for (var favs in favSongCheck) {
      int count = 0;
      for (var song in Songall) {
        if (favs.id == song.id) {
           FavouriteNotifier.value.add(song); 
          break;
        }else{ 
          count++;
        }
      }
      if (count == Songall.length) {
        var key = favs.key;
        favDB.delete(key);
      }   
    }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      FavouriteNotifier.notifyListeners;
  }


// Future <bool> isInFavoriteDb(int id) async{
//    final favDB = await Hive.openBox<FavoriteSongs>('fav_DB');
//    final bool isContain = favDB.containsKey(id);
//    return isContain;
// }
// addFavorite(int id)async{
//   final fav_db = await Hive.openBox<FavoriteSongs>('favorite');
//   await fav_db.put(id, FavoriteSongs(id: id));
//   for (var element in Songall) {
//     if (element.id == id) {
//       FavouriteNotifier.value.add(element);
//     }
//   }
// }
