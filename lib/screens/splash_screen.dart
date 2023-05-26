import 'dart:async';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/screens/bottom_nav_screen.dart';



List<SongDetails> ListOfSongs = [];
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    
  @override
  void initState() {
    SongFetch fetch = SongFetch();
    fetch.fetching();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return BottomNavigation();
            })));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCBCBCB),
      body: SizedBox(
        child: Image.asset('asset/hello.png'),
      ),
    );
  }


 
}





class SongFetch {
  final OnAudioQuery audioQuery = OnAudioQuery();
  permissionRequest()async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    }else{
      return false;
    }
  }

  fetching()async {
    bool status = await permissionRequest();
    if (status) {
      List<SongModel> fetchsong =await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL
      );
     
      for (SongModel element in fetchsong) {
        if (element.fileExtension == "mp3") {
          ListOfSongs.add(SongDetails(name: element.displayNameWOExt,
           artist: element.artist,
            duration: element.duration,
             id: element.id,
             songUrl:element.uri ));
        }
      }
    }
  }
}