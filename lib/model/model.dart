
import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';
@HiveType(typeId: 2)
class SongDetails {

  @HiveField(0)
  String? name;
    @HiveField(1)
  String? artist;
    @HiveField(2)
  int? duration;
    @HiveField(3)
  int? id;
    @HiveField(4)
  String? songUrl;


  SongDetails({required this.name,required this.artist,required this.duration,required this.id,required this.songUrl});
  
}

String boxname = 'songz';

class SongBox {
  static Box<SongDetails>? _box;
  static Box<SongDetails> getinstance(){
    return _box ??= Hive.box(boxname);
  }
}