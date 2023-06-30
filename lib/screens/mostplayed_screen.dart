import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/model/mostlyplayed/mostplayed.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/favourite_tile.dart';
// List<MostPlayed> allmpsongs = mostPlayedDb.values.toList();
// List<MostPlayed> tolist = [];

class MostPlayedScreen extends StatefulWidget {
  const MostPlayedScreen({super.key});

  @override
  State<MostPlayedScreen> createState() => _MostPlayedScreenState();
}

class _MostPlayedScreenState extends State<MostPlayedScreen> {



  @override
  void initState() {
    // List<MostlyPlayed> songsList = mostlyplayedDB.values.toList();

    // int i = 0;
    // for (var element in songsList) {
    //   if (element.count > 4) {
    //     mostlyPlayed.remove(element);
    //     mostlyPlayed.insert(i,element);
    //     i++;
    //   }
    // }
    // for (var items in mostlyPlayed) {
    //  songz.add(Audio.file(items.songurl,
    //  metas: Metas(
    //   title: items.songname,
    //   artist: items.artist,
    //   id: items.id.toString())));
    // }
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
   List<MostPlayed> mPSongs= sortMostlyPlayed();
   
    return Scaffold(
       appBar: AppBar(title:Text("Most played",
      style: GoogleFonts.crimsonPro(
                     color: Colors.black,
                     fontSize: 24,
                     fontWeight: FontWeight.w600)),
                     elevation: 0,
                    backgroundColor: const Color.fromARGB(15, 255, 255, 255),
                     centerTitle: true,
                      leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                     
                     ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width:double.infinity, 
        decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color.fromARGB(255, 194, 194, 194), Colors.black],
                    stops: [0, 0.6])),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ),
                child: ListView(
                
                  children: [
                   
                    // const SizedBox(height: 10,),
                    // Container(
                    //  height: 200,
                    //  width: 340,                  
                    //  decoration: BoxDecoration( color: const Color.fromRGBO(255, 255, 255, 0.07),
                    //  borderRadius: BorderRadius.circular(20),
                    //  ),
                    // child: Row(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 20),
                    //       child: Container(
                    //         height: 125,
                    //         width: 120,
                              
                    //           decoration: BoxDecoration(
                    //             image: const DecorationImage(image: NetworkImage("https://images6.fanpop.com/image/photos/38400000/-Ed-Sheeran-ed-sheeran-38449142-300-431.jpg"),fit: BoxFit.cover),
                    //             borderRadius: BorderRadius.circular(30)
                    //           ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 15),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text("Most Played Song",style: GoogleFonts.crimsonPro(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),
                    //           const SizedBox(height: 5,),
                    //           Text("Photograph",style: GoogleFonts.crimsonPro(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white),),
                    //           const SizedBox(height: 5,),
                    //           Text("Ed-Sheeran - 1000 plays",style: GoogleFonts.crimsonPro(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
                    //           const SizedBox(height: 10,),
                    //           Row(
                    //             children: [
                    //               Container(
                    //                 height: 50,
                    //                 width: 50,                          
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(100),
                    //                   color: Colors.white,), 
                    //                   child: const Icon(Icons.pause),    
                    //               ),
                    //               const SizedBox(width: 10,),
                    //                Container(
                    //                 height: 50,
                    //                 width: 50,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(100),
                    //                   color: Colors.white,),
                    //                   child: const Icon(Icons.favorite), 
                    //               ),
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // ),
                    Padding(/*  */
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text("Top Songs",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                    ),
                    ValueListenableBuilder(valueListenable: mostPlayedDb.listenable(), 
                    builder: (context, mostplayedsongs, child) {
                      //  List<MostPlayed> mPSongs= sortMostlyPlayed();
                      
  //                      for (var i = 0; i < mostPlayedDb.length; i++) {
  //                             var item = mostPlayedDb.getAt(i);
  //                                if (item != null && item.count != null && item.count! > 3) {
  //                                  mPSongs.add(item);
  //   }
  // }
                      // List<MostPlayed> mPSongs=mostPlayedDb.values.toList();
                      // List<MostPlayed>? mPSongs;
                      // for (var element in mPSongsDb) {
                      //   if(element.count!>3){
                      //     mPSongs!.add(element);
                      //   }
                        
                      // }
                       List<SongDetails> mpPlaysong = mPSongs.map((e) => 
                       SongDetails(name: e.songName,
                        artist: e.artist,
                         duration: e.duration,
                          id: e.songId, 
                          songUrl: e.songUrl)).toList();
                      return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mpPlaysong.length,
                      itemBuilder: (context, index) {
                       // converttolist(tolist, favl);
                      return GestureDetector(
                        onTap: () {
                          playMusic(index, mpPlaysong);
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      playingList.add(Audio(Songall[index].songUrl!));
                      return  ValueListenableBuilder(valueListenable: favDbObject.listenable(), builder: (context, value, child) {
                   bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                     return SongScreen(id: Songall[index].id!,isFav: contains,index: 1,);
                    },
                    );
                    }
                        ));
                        //  updatecount(tolist[index]);
                        },
                        child: FavTile(name: mpPlaysong[index].name!, 
                        artist: mpPlaysong[index].artist!, 
                        id: mpPlaysong[index].id!, 
                        duration: mpPlaysong[index].duration!,
                        index: index,
                        )
                        );
                    },);
                    },)
                  ],
                ),
              ),
            ),
      ),
    );
  }
  //   updatecount(MostlyPlayed data) {
  //   int idx = allmpsongs.indexWhere((element) => element == data);
  //   int count = data.count!;
  //   data.count = count + 1;
  //   mostlyplayedDB.put(idx, data);
  // }
}