
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/screens/threedots_tile.dart';
import 'package:project_main/widget/fav_icon.dart';



// ignore: camel_case_types
class musicTiles extends StatefulWidget {

  String name;
  String artist;
  int duration;
  int id;
SongDetails song;
int index;
   musicTiles({
    super.key,required this.name,required this.artist,required this.duration,required this.id,required this.song,required this.index

  });

  @override
  State<musicTiles> createState() => _musicTilesState();
}

// ignore: camel_case_types
class _musicTilesState extends State<musicTiles> {
 


   String _formatDuration(int duration) {
    Duration d = Duration(milliseconds: duration);
    String minutes = (d.inMinutes).toString().padLeft(2, '0');
    String seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  bool songNotPresent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(           
        height: MediaQuery.of(context).size.height * 0.125,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft ,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 173, 173, 173),Color(0xFFc3c3c3),Color(0xFFDBDBDB),Color(0xFFc3c3c3)],
            stops: [0.3,0.6,0.7,0.9]
            ),
            borderRadius: BorderRadius.circular(10)
            ),
           child: Row(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 15),
                 child:
                 QueryArtworkWidget(
                  artworkHeight: MediaQuery.of(context).size.width * .15,
                  artworkWidth: MediaQuery.of(context).size.width * .15,
                  id: Songall[widget.index].id!,
                  type: ArtworkType.AUDIO,
                  artworkFit: BoxFit.cover,
                  artworkQuality: FilterQuality.high,
                  size: 2000,
                  quality: 100,
                  artworkBorder: BorderRadius.circular(50),
                  nullArtworkWidget:  Container(
                  height: MediaQuery.of(context).size.width * .15,
                  width: MediaQuery.of(context).size.width * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image:  AssetImage('asset/apple-music-note.jpg'),fit: BoxFit.cover)),
                  
                 ),
                  ),
               
               
               ),
               Padding(
                 padding: const EdgeInsets.only(left : 12),
                 child: SizedBox(
                   width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.name,style: GoogleFonts.crimsonPro(fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis),
                      // Text(widget.name,style: GoogleFonts.crimsonPro(fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,),
                      Row(
                        
                        children: [
                            SizedBox(
                              width:MediaQuery.of(context).size.width * .23,
                              child: Text(widget.artist,style: GoogleFonts.crimsonPro(fontWeight: FontWeight.bold,fontSize: 14),overflow: TextOverflow.ellipsis)),
                            const Padding(
                              padding: EdgeInsets.only(top: 6,left: 10,right: 10),
                              child: CircleAvatar(radius: 2,backgroundColor: Colors.black,),
                            ),
                            Text(_formatDuration(widget.duration),style: GoogleFonts.crimsonPro(fontSize: 15,fontWeight: FontWeight.w600),),
                        ],
                      )
                     
                    ],
                  ),
                 ),
                 
               ),
               SizedBox(width: MediaQuery.of(context).size.width * .12,),
               Row(
                 children: [
                 ValueListenableBuilder(valueListenable: favDbObject.listenable(), builder: (context, value, child) {
                   bool contains=favDbObject.values.where((element) => element.id==widget.id).isEmpty;
                   return FavIcon(id: widget.id, isFav: contains);
                 },),
                       const SizedBox(width: 10,),
                       GestureDetector(
                         onTap: () {
                          
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                             return ThreeDotsTile(index: widget.index,name: widget.name,);
                           },));
                         },
                         child: const Icon( Icons.more_vert))
                 ],
               )
             ],
           ),
      ),
    );
  }
}
