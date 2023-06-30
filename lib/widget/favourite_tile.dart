import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/screens/addtoplaylist_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/liked_icon.dart';

// ignore: must_be_immutable
class FavTile extends StatefulWidget {
   String name;
  String artist;
  int duration;
  int id;
  int index;
  

  FavTile(
      {super.key, required this.name,
       required this.artist,
        required this.id,
        required this.duration,
        required this.index});

  @override
  State<FavTile> createState() => _FavTileState();
}

class _FavTileState extends State<FavTile> {



   String _formatDuration(int duration) {
    Duration d = Duration(milliseconds: duration);
    String minutes = (d.inMinutes).toString().padLeft(2, '0');
    String seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // const CircleAvatar(
                //   backgroundImage: NetworkImage(
                //       "https://i.pinimg.com/170x/26/f1/ff/26f1ff753a4c2fc8454368b5679533d1.jpg"),
                //   radius: 30,
                // ),
                 QueryArtworkWidget(
                  artworkHeight: MediaQuery.of(context).size.width * .15,
                  artworkWidth: MediaQuery.of(context).size.width * .15,
                  id: widget.id,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * .50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name,
                            style: GoogleFonts.crimsonPro(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800
                                
                                ),
                                overflow: TextOverflow.ellipsis,
                                ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .27,
                              child: Text(widget.artist,
                                  style: GoogleFonts.crimsonPro(
                                      color: const Color.fromARGB(255, 221, 221, 221),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 10),
                              child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Color.fromARGB(255, 221, 221, 221)),
                            ),
                            Text(_formatDuration(widget.duration),
                                style: GoogleFonts.crimsonPro(
                                    color: const Color.fromARGB(255, 221, 221, 221),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      setState(() {
                        if (favDbObject.values.where((element) => element.id == widget.id).isEmpty) {
                          addToFav(widget.id);
                          const snackBar1 = SnackBar(
               backgroundColor: Colors.blueAccent,
              content: Text("Added to favourite"));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                        }else{
                          removeFromFav(widget.id);
                        const snackBar =
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Removed from Favourites"));
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                       
                      });
                    },
                    child:favDbObject.values.where((element) => element.id == widget.id).isEmpty ?
                     const Icon(Icons.favorite_rounded,color: Colors.white,)  : IconGradient(sizeOf: 0.031,)),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0,
                // ),
               PopupMenuButton(
                icon: const Icon(Icons.more_vert,color: Colors.white,),
                itemBuilder: (context) {
                        return [PopupMenuItem(
                          
                          child: GestureDetector(
                            onTap: () {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                     return AddToPlaylistScreen(  song:Songall[widget.index]);
                   },));
                            },
                            child: ListTile(title: Text("Add to playlsit"),)))];
                      },)
              ],
            )
          ],
        ),
      ),
    );
  }
}
