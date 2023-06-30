import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/widget/duration_converter.dart';

// ignore: must_be_immutable
class SearchTile extends StatefulWidget {
  SearchTile({super.key,required this.name,required this.artist,required this.duration,required this.id,required this.song,required this.index});
  String name;
  String artist;
  int duration;
  int id;
SongDetails song;
int index;
  @override
  State<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
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
                            fontWeight: FontWeight.w800,
                            
                            ),
                            overflow: TextOverflow.ellipsis,
                            ),
                    Row(
                      children: [
                        Text(widget.artist,
                            style: GoogleFonts.crimsonPro(
                                color: const Color.fromARGB(255, 221, 221, 221),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
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
          ],
        ),
      ),
    );
  }
}