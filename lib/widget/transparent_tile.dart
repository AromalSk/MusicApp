  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/widget/duration_converter.dart';

//   bool click = false;
// Container songTile(BuildContext context,int id,String name,String artist) {
//     return 
//   }


// ignore: must_be_immutable
class TransparentTiles extends StatefulWidget {
   String name;
  String artist;
  int duration;
  int id;
SongDetails song;

   TransparentTiles({super.key, required this.name, required this.artist, required this.id,required this.duration,required this.song});

  @override
  State<TransparentTiles> createState() => _TransparentTilesState();
}

class _TransparentTilesState extends State<TransparentTiles> {
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
                 const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/170x/26/f1/ff/26f1ff753a4c2fc8454368b5679533d1.jpg"),
              radius: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .55,
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
                            fontWeight: FontWeight.w800)),
                    Row(
                      children: [
                        Text(widget.artist,
                            style: GoogleFonts.crimsonPro(
                                color: const Color.fromARGB(255, 221, 221, 221),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: CircleAvatar(
                              radius: 3,
                              backgroundColor:
                                  Color.fromARGB(255, 221, 221, 221)),
                        ),
                        Text(formatDuration(widget.duration),
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
                         onTap: () async{  
                         
                      const snackBar = SnackBar(content: Text("Added to Favourites") );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      
                         },
                         child: Icon((click) ? Icons.favorite_rounded : Icons.favorite_rounded,color: Colors.white,)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .03,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}