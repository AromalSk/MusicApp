import 'package:hive/hive.dart';
 part 'favourite.g.dart';
@HiveType(typeId: 1)
class FavoriteSongs extends HiveObject{

  @HiveField(0)
  int id;

 FavoriteSongs({required this.id});
}
