  
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/screens/threedots_playlist_screen.dart';

Widget tile(BuildContext context,String playlistName,int index){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(     
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                 gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFDDDDDD), Color(0xFFA1A1A1)],
                  stops: [0, 1])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .17,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(90),topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                          image: DecorationImage(
                            image: NetworkImage('https://wallpapers.com/images/hd/alan-walker-artwork-9j4agh7wuogg0kp6.jpg'),
                            fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top : 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .3,
                                child: Text(playlistName,
                                style: GoogleFonts.crimsonPro(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20            
                                ),overflow: TextOverflow.ellipsis,),
                              ),
                            ),
                           GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return ThreedotsPlaylistScreen(index: index,ctx: context,playListname: playlistName,);
                              },));
                            },
                            child: const Icon(Icons.more_vert)) 
                          ],
                        ),
                      )
                    ],
                  ),
            ),
  );
}