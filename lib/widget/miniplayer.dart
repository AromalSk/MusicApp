import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_main/screens/home_screen.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';

class MiniPlayer extends StatefulWidget {

  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  // AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    return player.builderCurrent(builder: (context, playing) {
      log('playing');
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            //    gradient: const LinearGradient(
            //   begin: Alignment.center,
            //   end: Alignment.bottomCenter,
            //   colors: [Color.fromARGB(255, 124, 31, 158), Color(0xFF6300E0)], 
            //   stops: [0.5,0.9]
            // ), 
            // color: Colors.redAccent
            color: Colors.blueGrey.shade400
            ),
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
                //---------------------------(On tap)-------------------------------------------
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    // playMusic(Songall[widget.index].id!, Songall);
                     // bool contains=favDbObject.values.where((element) => element.id==Songall[widget.index].id).isEmpty;
                    // ignore: prefer_const_constructors
                    return SongScreen(isFav:true , id: Songall[1].id!, index: 1);
                  }));
                },
                //---------------------------(Image)--------------------------------------------
                leading: QueryArtworkWidget(
               
                  id: int.parse(playing.audio.audio.metas.id!),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const CircleAvatar(
                    radius: 28,
                    backgroundImage:
                       AssetImage('asset/apple-music-note.jpg')
                  ),
                  artworkFit: BoxFit.fill,
                ),
                //---------------------------(Title)--------------------------------------------
                title: Marquee(
                  text: player.getCurrentAudioTitle,
                  blankSpace: 90,
                  style: const TextStyle(color: Colors.white),
                ),
                //---------------------------(Controls)-----------------------------------------
                trailing: PlayerBuilder.isPlaying(
                    player: player,
                    builder: (context, isPlaying) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await player.previous();
                                setState(() {});
                                if (isPlaying == false) {
                                  player.pause();
                                }
                              },
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () async {
                                await player.playOrPause();
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () async {
                                await player.next();
                                setState(() {});
                                if (isPlaying == false) {
                                  player.pause();
                                }
                              },
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              )),
                        ],
                      );
                    }))),
      );
    });
  }
}


//  colors: [Color(0xFFBF00D0),Color(0xFF61187C), Color(0xFF6300E0)], 
//               stops: [0.1,0.5,0.9]



  // gradient: LinearGradient(
  //             begin: Alignment.center,
  //             end: Alignment.bottomCenter,
  //             colors: [Color(0xFFBF00D0),Color.fromARGB(255, 124, 31, 158), Color(0xFF6300E0)], 
  //             stops: [0.1,0.5,0.9]
  //           ), 