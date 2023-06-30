import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/widget/duration_converter.dart';

// ignore: must_be_immutable
class RecentlyPlayedTile extends StatelessWidget {
    String name;
  String artist;
  int duration;
  int id;

int index;
 RecentlyPlayedTile({super.key,required this.name,required this.artist,required this.duration,required this.id,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                       
                        const CircleAvatar(
                          backgroundImage: NetworkImage("https://i.pinimg.com/170x/26/f1/ff/26f1ff753a4c2fc8454368b5679533d1.jpg"),
                          radius: 30,
                          ),
                        SizedBox(
                          width: 215,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800)),
                                Row(
                                  children: [
                                    Text(artist,style: GoogleFonts.crimsonPro(color: const Color.fromARGB(255, 221, 221, 221),fontSize: 14,fontWeight: FontWeight.w500)),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5,left: 10,right: 10),
                                      child: CircleAvatar(radius: 3,backgroundColor: Color.fromARGB(255, 221, 221, 221)),
                                    ),
                                    Text(formatDuration(duration),style: GoogleFonts.crimsonPro(color: const Color.fromARGB(255, 221, 221, 221),fontSize: 16,fontWeight: FontWeight.w500))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: const Icon(Icons.favorite_rounded,color: Colors.white,)),
                        const SizedBox(width: 10,),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        //       return ThreeDotsTile(index: 1,);
                        //     },));
                        //   },
                        //   child: const Icon(Icons.more_vert,color: Colors.white,))
                      ],
                    ),
                   );
  }
}
  