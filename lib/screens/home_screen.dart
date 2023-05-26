
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/screens/favorites_screen.dart';
import 'package:project_main/screens/mostplayed_screen.dart';
import 'package:project_main/screens/playlist_screen.dart';
import 'package:project_main/screens/recently_played.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/music_card.dart';
import 'package:project_main/widget/music_tile.dart';

final AssetsAudioPlayer player = AssetsAudioPlayer();
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFb1b1b1), Colors.black],
                  stops: [0, 0.5])),
          child:  
           ListView(
             children: [
               Container(
                padding: EdgeInsets.only(left: 30,top: 10,right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Music",
                      style: GoogleFonts.crimsonPro(fontSize: 27, color: Colors.white),
                    ),
                    SizedBox(height: 40,),
                  GridView.builder(
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 20,
                    ), 
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return  GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return PlaylistScreen();
                            },));
                          },
                          child: musicCard(
                            cardName: "Playlist",
                            icon: Icons.queue_music_rounded,
                            context: context
                            ));
                      }else if(index == 1){
                        return GestureDetector(
                          child: musicCard(
                            cardName: "Most Played", 
                            icon: Icons.repeat_one_outlined,
                            context: context
                            ),
                              onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return MostPlayedScreen();
                            },));
                          },
                            );
                      }else if(index == 2){
                        return GestureDetector(
                          onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return Favorites();
                          },));
                          },
                          child: musicCard(
                            cardName: "Favorites",
                             icon: Icons.favorite_outlined,
                              context: context));
                      }else if(index == 3){
                        
                        return GestureDetector(
                          onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return RecentlyPlayed();
                          },));
                          },
                          child: musicCard(
                            cardName: "Recently Played",
                             icon: Icons.access_time_filled_outlined,
                              context: context));
                      }
                    },                
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 10,bottom: 20),
                      child: Text("All Songs",style: 
                      GoogleFonts.dosis(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)
                      ),
                    ),              
                  ],
                ),
          ),
         ListView.builder(
           physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
          itemCount: ListOfSongs.length,
          itemBuilder: (context, index) {
           return GestureDetector(
            onTap: ()async {
           await playMusic(index,ListOfSongs);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                playingList.add(Audio(ListOfSongs[index].songUrl!));
                return SongScreen();
              },));
            },
            child: musicTiles(name: ListOfSongs[index].name!,artist: ListOfSongs[index].artist??'unknown',duration: ListOfSongs[index].duration!,));
         },)
          
             ],
           ), 
                   
        ), 
        
      ),      
    );
    
  }
  
  


  
}

