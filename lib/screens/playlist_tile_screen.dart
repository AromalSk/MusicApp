import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';

import 'package:project_main/model/playlist/playlist_function.dart';

import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/add_song_bottomsheet.dart';
import 'package:project_main/widget/favourite_tile.dart';


// ignore: must_be_immutable
class PlaylistTileScreen extends StatelessWidget {
  int indexs;
  String title;
  
   PlaylistTileScreen({super.key,required this.indexs,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Playlist",
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
                  
                   SizedBox(
                     width: MediaQuery.of(context).size.width * .7,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(title,
                          style: GoogleFonts.crimsonPro(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                        )
                      ],
                     ),
                   ),
                   ElevatedButton.icon(
                    onPressed: (){
                     playlistBottomSheet(context,title,indexs);
                   }, icon: const Icon(Icons.add), label:const Text('Add new songs'),
                     style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
  ),
                   ),
                   
                   ValueListenableBuilder(
                    valueListenable: PlayListNotifier,
                    builder: (context, value, child) {
                      // List<EachPlayList> hooii = PlayListNotifier.value.toList();
                      // List<SongDetails> play = hooii.map((played){
                      //   return SongDetails(name: played.name,
                      //    artist: played, 
                      //    duration: played,
                      //     id: played,
                      //      songUrl: played);
                      // }).toList();
                      
                    //     List<SongDetails> Playingsong = hooii.map(
                    //  (recentSong) {
                    //         // Convert each RecentlyPlayed object to SongDetails
                    //         return SongDetails(
                    //           name: recentSong.songname!,
                    //           artist: recentSong.artist!,
                    //           duration: recentSong.duration!,
                    //           songUrl: recentSong.songurl!,
                    //           id: recentSong.id!,
                    //         );
                    //       },
                    //     ).toList(); 
                      return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                      itemCount: value[indexs].container.length,
                      itemBuilder: (context, index) {
                       return GestureDetector(
                        onTap: () async{
                           await playMusic(index, value[indexs].container);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return  ValueListenableBuilder(valueListenable: favDbObject.listenable(), builder: (context, value, child) {
                     bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                       return SongScreen(id: Songall[index].id!,isFav: contains,index: index,);
                      },
                      );
                          },));
                        },
                        child: FavTile(
                          name: value[indexs].container[index].name!,
                           artist: value[indexs].container[index].artist!, 
                           id: value[indexs].container[index].id!, 
                           duration: value[indexs].container[index].duration!,
                           index: index,
                           )
                        
                        );
                        // child:  TransparentTiles(name: Songall[index].name!,artist:Songall[index].artist!,duration: Songall[index].duration!,id: Songall[index].id!,song: Songall[index] ,));
                     },);
                    },
                   
                   )
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

