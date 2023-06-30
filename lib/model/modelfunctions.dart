import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/model/model.dart';


// ignore: non_constant_identifier_names
late Box<SongDetails>AllSongDb;
openAllSongs()async{
  AllSongDb = await Hive.openBox<SongDetails>('all_song_DB');
  }