import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/functions/play_pause.dart';
import 'package:project_main/screens/home_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/screens/threedots_tile.dart';


class SongScreen extends StatefulWidget {
   const  SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFE5E5E5), Color(0xFF1C1C1C)],
                  stops: [0, 0.99])),
          child: player.builderCurrent(builder: (context, playing) {
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
             
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      GestureDetector(
                         onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                             return ThreeDotsTile();
                           },));
                         },
                         child: Icon(Icons.more_vert))
                    ],
                  ),
                ),
                Container(
                  height: 370,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://wallpapercave.com/wp/wp6489872.png'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(Icons.favorite_rounded,size: 40,),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(player.getCurrentAudioTitle,style: GoogleFonts.crimsonPro(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(player.getCurrentAudioArtist,style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {

                          
                        }, icon: Icon(Icons.shuffle_rounded,color: Colors.white,)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      height:  MediaQuery.of(context).size.height * .11,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            right: 20,
                            bottom: 20,
                            child: GestureDetector(
                              child: Container(
                               height: 55,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(100),
                                        bottomRight: Radius.circular(100))),
                                        child: GestureDetector(
                                          onTap: () {
                                             player.next();
                                          },
                                          child: Icon(Icons.skip_next_rounded,size: 30,)),
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
                                height: 55,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100))),
                                        child: Icon(Icons.skip_previous_rounded,size: 30,),
                              ),
                            ),
                                                   ),
                          Positioned(
                            left: 75,
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  color:  Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(100)),
                                  // child: Icon(Icons.play_arrow,color: Colors.white,size: 50,),
                               child: Center(child: AnimatedPlayPause()),
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                  
                    IconButton(onPressed: () {
                       
                    }, icon: Icon(Icons.repeat,color: Colors.white,))
                    
                  ],
                )
              ],
            ),
          );
          },)
        ),
      ),
    );
  }
}
