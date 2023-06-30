import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/model/favourite/favourite.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/model/modelfunctions.dart';
import 'package:project_main/model/mostlyplayed/mostplayed.dart';
import 'package:project_main/model/playlist/playlist.dart';
import 'package:project_main/model/recentlyplayed/recentlyplayed.dart';
import 'package:project_main/screens/splash_screen.dart';
main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(FavoriteSongsAdapter().typeId)) {
    Hive.registerAdapter(FavoriteSongsAdapter());
  }
  if (!Hive.isAdapterRegistered(SongDetailsAdapter().typeId)) {
    Hive.registerAdapter(SongDetailsAdapter());
  }
   if (!Hive.isAdapterRegistered(PlayListModelAdapter().typeId)) {
    Hive.registerAdapter(PlayListModelAdapter());
  }
  if (!Hive.isAdapterRegistered( RecentlyPlayedAdapter().typeId)) {
    Hive.registerAdapter(RecentlyPlayedAdapter());
  }
  // if (!Hive.isAdapterRegistered( MostlyPlayedAdapter().typeId)) {
  //   Hive.registerAdapter(MostlyPlayedAdapter());
  // }
  if (!Hive.isAdapterRegistered( MostPlayedAdapter().typeId)) {
    Hive.registerAdapter(MostPlayedAdapter());
  }
 await openAllSongs();
  await openFav();
 await openRecentlyPlayedDB();
 await openMostlyPlayed();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {                                             
  const MyApp({super.key});


 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',  
      theme: ThemeData(  
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen()
      
    );
  }
}

