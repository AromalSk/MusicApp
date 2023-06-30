import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/model/recentlyplayed/recentlyplayed.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/favourite_tile.dart';
 

class RecentlyPlayedScreen extends StatefulWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  State<RecentlyPlayedScreen> createState() => _RecentlyPlayedScreenState();
}

class _RecentlyPlayedScreenState extends State<RecentlyPlayedScreen> {
  //  List<Audio> rsongplaying = [];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Playlist ",
      style: GoogleFonts.crimsonPro(
                     color: Colors.white,
                     fontSize: 24,
                     fontWeight: FontWeight.w600)),
                     elevation: 0,
                    backgroundColor: const Color.fromARGB(76, 80, 80, 80),
                     centerTitle: true,
                      leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios)),
                     
                     ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
         decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color.fromARGB(255, 201, 201, 201), Colors.black],
                    stops: [0, 0.55])),
          child: ListView(
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 20,right: 20),
               child: Column(
                 children: [
                  
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Recently Played",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w800))
                    ],
                   ),
                ValueListenableBuilder(valueListenable:recentlyPlayedDB.listenable(),
                 builder:(context,Box<RecentlyPlayed> recentsongs, child) {
                  List<RecentlyPlayed> rsongs = recentsongs.values.toList().reversed.toList();
                  // ignore: non_constant_identifier_names
                  List<SongDetails> Playingsong = rsongs.map(
                     (recentSong) {
                            // Convert each RecentlyPlayed object to SongDetails
                            return SongDetails(
                              name: recentSong.songname!,
                              artist: recentSong.artist!,
                              duration: recentSong.duration!,
                              songUrl: recentSong.songurl!,
                              id: recentSong.id!,
                            );
                          },
                        ).toList(); 
                   return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                    itemCount: rsongs.length,
                    itemBuilder: (context, index) {
                     return GestureDetector(
                      onTap: ()async {
                      
                         await playMusic(index, Playingsong);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          playingList.add(Audio(Songall[index].songUrl!));
                           return  ValueListenableBuilder(
                            valueListenable: favDbObject.listenable(),
                            builder: (context, value, child) {
                 bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                   return SongScreen(id: Playingsong[index].id!,isFav: contains,index: index,);
                  },
                  );
                        },
                      ));
                      },
                      // child: RecentlyPlayedTile(
                      //   name: rsongs[index].songname!,
                      //   artist: rsongs[index].artist!,
                      //   duration:rsongs[index].duration!,
                      //   id: rsongs[index].id!,
                      //  index: index,

                      // )
                      child: FavTile(name: rsongs[index].songname!,
                       artist: rsongs[index].artist!, 
                       id:rsongs[index].id!,
                        duration:rsongs[index].duration!,
                       index: index,
                        ),
                      );
                   },);
                 },)
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
