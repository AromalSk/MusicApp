import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/model/playlist/playlist.dart';
import 'package:project_main/model/playlist/playlist_class.dart';
import 'package:project_main/screens/splash_screen.dart';
// ignore: non_constant_identifier_names
ValueNotifier<List<EachPlayList>> PlayListNotifier = ValueNotifier([]);


createPlayList(String name) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist'); 
  playListDb.add(PlayListModel(playlistName: name));
  PlayListNotifier.value.add(EachPlayList(name: name));
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

deletePlayList(int index) async {
  String playListname = PlayListNotifier.value[index].name;
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playlistName== playListname) {
      var key = element.key;
      playListDb.delete(key);
      break;
    }
  }
  PlayListNotifier.value.removeAt(index);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

getPlayList() async {
  PlayListNotifier.value.clear();
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (PlayListModel element in playListDb.values) {
    String playListName = element.playlistName;
    EachPlayList playlistfetch = EachPlayList(name: playListName);
    for (int id in element.item) {
      for (SongDetails song in Songall) {
        if (id == song.id) {
          playlistfetch.container.add(song);
          break;
        }
      }
    }
    PlayListNotifier.value.add(playlistfetch);
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

addSongToPlayList(SongDetails addingSong, String playListName) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playlistName == playListName) {
      var key = element.key;
      PlayListModel updatePlayList = PlayListModel(playlistName: playListName);
      updatePlayList.item.addAll(element.item);
      updatePlayList.item.add(addingSong.id!);
      playListDb.put(key, updatePlayList);

      break;
    }
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

removeSongfromPlayList(SongDetails removingSong, String playListName) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playlistName == playListName) {
      var key = element.key;
      PlayListModel updatePlayList = PlayListModel(playlistName: playListName);
      for (var item in element.item) {
        if (item == removingSong.id) {
          continue;
        }
        updatePlayList.item.add(item);
      }
      playListDb.put(key, updatePlayList);
      break;
    }
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

playListRename(int index, String newName) async {
  String playListName = PlayListNotifier.value[index].name;
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playlistName == playListName) {
      var key = element.key;
      element.playlistName = newName;
      playListDb.put(key, element);
    }
  }
  PlayListNotifier.value[index].name = newName;
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}