
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/model/mostlyplayed/mostplayed.dart';
import 'package:project_main/model/playlist/playlist_function.dart';
import 'package:project_main/model/recentlyplayed/recentlyplayed.dart';
import 'package:project_main/screens/favorites_screen.dart';
import 'package:project_main/screens/mostplayed_screen.dart';
import 'package:project_main/screens/playlist_screen.dart';
import 'package:project_main/screens/recently_played.dart';
import 'package:project_main/screens/settings_screen.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/miniplayer.dart';
import 'package:project_main/widget/music_card.dart';
import 'package:project_main/widget/music_tile.dart';

final AssetsAudioPlayer player = AssetsAudioPlayer();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {late int idx;
@override
  void initState() {setState(() {
    getFav();
    getPlayList();
    
   
  });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 10,left: 5,right: 5),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFb1b1b1), Colors.black],
                  stops: [0, 0.5])),
          child: ListView(physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Music",
                          style: GoogleFonts.crimsonPro(
                              fontSize: 27, color: Colors.white),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const SettingsScreen();
                                },
                              ));
                            },
                            child: const Icon(
                              Icons.miscellaneous_services,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: 4,
                      // ignore: body_might_complete_normally_nullable
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const PlaylistScreen();
                                  },
                                ));
                              },
                              child: musicCard(
                                  cardName: "Playlist",
                                  icon: Icons.queue_music_rounded,
                                  context: context));
                        } else if (index == 1) {
                          return GestureDetector(
                            child: musicCard(
                                cardName: "Most Played",
                                icon: Icons.repeat_one_outlined,
                                context: context),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const MostPlayedScreen();
                                },
                              ));
                            },
                          );
                        } else if (index == 2) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Favorites();
                                  },
                                ));
                              },
                              child: musicCard(
                                  cardName: "Favorites",
                                  icon: Icons.favorite_outlined,
                                  context: context));
                        } else if (index == 3) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const RecentlyPlayedScreen();
                                  },
                                ));
                              },
                              child: musicCard(
                                  cardName: "Recently Played",
                                  icon: Icons.access_time_filled_outlined,
                                  context: context));
                        }
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                      child: Text("All Songs",
                          style: GoogleFonts.dosis(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder<List<SongDetails>>(
                valueListenable: FavouriteNotifier,
                 builder: (BuildContext context,List<SongDetails> songs, child) {
                   return ListView.builder(
               
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Songall.length,
                itemBuilder: (context, index) {
                  MostPlayed mpsong=MostPlayed(duration: Songall[index].duration! ,songId: Songall[index].id!, artist: Songall[index].artist??'unknown', songName:  Songall[index].name??'unknown', songUrl:  Songall[index].songUrl!);
                  // MostPlayed mpsong = allmpsongs[index];
                  RecentlyPlayed rpsongs;
                  
                  return GestureDetector(
                      onTap: () async {
                       // updatempcount(mpsong);
                       addMostPlayedSong(mpsong);
                       rpsongs = RecentlyPlayed(songname: Songall[index].name,
                        artist:  Songall[index].artist ?? 'unknown', 
                        duration: Songall[index].duration,
                         songurl: Songall[index].songUrl, 
                         id: Songall[index].id);                      
                        updatedRecentlyPlayed(rpsongs);
                        await playMusic(index, Songall);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                             idx=index;
                            playingList.add(Audio(Songall[index].songUrl!));
                             return  ValueListenableBuilder(
                              valueListenable: favDbObject.listenable(),
                              builder: (context, value, child) {
                   bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                     return SongScreen(id: Songall[index].id!,isFav: contains,index: index,);
                    },
                    );
                          },
                        ));
                      },
                      child: musicTiles(
                        song:Songall[index] ,
                        name: Songall[index].name!,
                        artist: Songall[index].artist ?? 'unknown',
                        duration: Songall[index].duration!,
                        id: Songall[index].id!,
                        index: index,
                      )
                      
                      );
                     
                },
              
              );
              

                 },),
                 const SizedBox(height: 90,)
            ],
          
          ),
          
        ),
        
      ),
      
  bottomSheet:
   const MiniPlayer(), 
    );
  }
}
