import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/favourite_tile.dart';
import 'package:project_main/widget/miniplayer.dart';




class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      appBar: AppBar(title:Text("Favorites",
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
                     Text("Liked by you",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w600))
                    ],
                   ),
                ValueListenableBuilder(
                  valueListenable: FavouriteNotifier,
                  builder: (context,favSongss, _) {
                    return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                    itemCount: favSongss.length,
                    itemBuilder: (context, index) {
                     return GestureDetector(
                      onTap: () async {
                        await playMusic(index, FavouriteNotifier.value);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      playingList.add(Audio(Songall[index].songUrl!));
                      return  ValueListenableBuilder(valueListenable: favDbObject.listenable(), builder: (context, value, child) {
                   bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                     return SongScreen(id: Songall[index].id!,isFav: contains,index: index,);
                    },
                    );
                    }
                        ));
                      },
                      child: FavTile(
                        name: favSongss[index].name!,
                         artist:  favSongss[index].artist!,
                          id:  favSongss[index].id!,
                          duration: favSongss[index].duration!,
                          index: index,
                          ));
                       },);
                  }
                )
                 ],
               ),
             )
            ],
          ),
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }
}


 


