
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_main/functions/play_pause.dart';
import 'package:project_main/screens/home_screen.dart';
import 'package:project_main/screens/threedots_tile.dart';
import 'package:project_main/widget/favicon_playingscreen.dart';

// ignore: must_be_immutable
class SongScreen extends StatefulWidget {
  bool isFav;
  int id;
  int index;
  SongScreen({super.key,required this.isFav,required this.id,required this.index});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  bool shuffle = false;
  bool repeat = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color(0xFFE5E5E5), Color(0xFF1C1C1C)],
                    stops: [0, 0.99])),
            child: player.builderCurrent(
              builder: (context, playing) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return ThreeDotsTile(index: widget.index,name: player.getCurrentAudioTitle,);
                                  },
                                ));
                              },
                              child: const Icon(Icons.more_vert))
                        ],
                      ),
                      QueryArtworkWidget(
                  artworkHeight: MediaQuery.of(context).size.height * .45,
                  artworkWidth: MediaQuery.of(context).size.width * .9,
                  id: int.parse(playing.audio.audio.metas.id!),
                  type: ArtworkType.AUDIO,
                  artworkFit: BoxFit.cover,
                  artworkQuality: FilterQuality.high,
                  size: 2000,
                  quality: 100,
                  artworkBorder: const BorderRadius.only(topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
                  nullArtworkWidget:      Container(
                    height: MediaQuery.of(context).size.height * .45,
                    width: MediaQuery.of(context).size.width * .9,
                        // height: 370,
                        // width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://wallpapercave.com/wp/wp6489872.png'),
                                fit: BoxFit.cover)),
                      ),
                 ),
                 
                      // Container(
                      //   height: 370,
                      //   width: 200,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.only(
                      //           bottomLeft: Radius.circular(100),
                      //           bottomRight: Radius.circular(100)),
                      //       image: DecorationImage(
                      //           image: NetworkImage(
                      //               'https://wallpapercave.com/wp/wp6489872.png'),
                      //           fit: BoxFit.cover)),
                      // ), 
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      player.builderRealtimePlayingInfos(
                        builder: (context, realtimePlayingInfos) {
                          return ProgressBar(
                            
                            thumbColor: Colors.purple,
                            bufferedBarColor: Colors.amber,
                            progressBarColor: Colors.black,
                            baseBarColor: Colors.white,
                            thumbGlowColor: Colors.blue,
                            thumbGlowRadius: 20,barCapShape:BarCapShape.square,
                          
                              progress: realtimePlayingInfos.currentPosition,
                              total: realtimePlayingInfos.duration,
                              onSeek: (duration) {
                                player.seek(duration);
                              },
                              timeLabelTextStyle: GoogleFonts.crimsonPro(),
                              );
                              
                        },
                      ),
                     FavIconPlayingScreen(id: widget.id, isFav: widget.isFav),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                      width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Marquee(text: player.getCurrentAudioTitle, style: GoogleFonts.crimsonPro(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                  ),
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  blankSpace: 20.0,
                                  velocity: 25.0,
                                  pauseAfterRound: const Duration(seconds: 1),
                                  showFadingOnlyWhenScrolling: true,
                                  ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Text(
                      //     player.getCurrentAudioTitle,
                      //     style: GoogleFonts.crimsonPro(
                      //         fontSize: 24,
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600),
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            player.getCurrentAudioArtist,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  shuffle = !shuffle;
                                  if (shuffle) {
                                     player.toggleShuffle();
                                  } else{
                                    player.setLoopMode(LoopMode.playlist);
                                  }
                                });

                               
                              },
                              icon:shuffle ? const Icon(
                                Icons.shuffle_rounded,
                                color: Colors.green,
                                size: 30,
                              ): const Icon(
                                Icons.shuffle_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            height: MediaQuery.of(context).size.height * .11,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  right: 20,
                                  bottom: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      player.next();
                                    },
                                    child: Container(
                                       height: MediaQuery.of(context).size.height*0.07,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      // height: 55,
                                      // width: 70,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(100),
                                              bottomRight:
                                                  Radius.circular(100))),
                                      child: const Icon(
                                        Icons.skip_next_rounded,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      player.previous();
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.07,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      // height: 55,
                                      // width: 70,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(100),
                                              bottomLeft:
                                                  Radius.circular(100))),
                                      child: const Icon(
                                        Icons.skip_previous_rounded,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 75,
                                  bottom: 8,
                                  child: Container(
                                    height: MediaQuery.of(context).size.width * .21,
                                    width: MediaQuery.of(context).size.width * .21,
                                    // height: 85,
                                    // width: 85,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    // child: Icon(Icons.play_arrow,color: Colors.white,size: 50,),
                                    child: Center(child: AnimatedPlayPause()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  repeat = !repeat;
                                  if (repeat) {
                                     player.toggleLoop();
                                  }else{
                                    player.setLoopMode(LoopMode.playlist);
                                  }
                                });
                               
                              },
                              icon:repeat ?  const Icon(
                                Icons.repeat,
                                color: Colors.green,
                                size: 30,
                              ) : const Icon(
                                Icons.repeat,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      )
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
