import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/screens/playlist_tile_screen.dart';
import 'package:project_main/widget/playlist_box_tile.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color.fromARGB(118, 80, 80, 80),
        elevation: 0,
        title:Text("Playlist",style: GoogleFonts.crimsonPro(
                         color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),centerTitle: true,),
      body: Container(
       decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFb1b1b1),Color.fromARGB(255, 77, 77, 77)],
                  stops: [0, 0.6])),
        child: Column(
          children: [
          Expanded(
            child: GridView.builder(
              itemCount: 30,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
               itemBuilder: (context, index) {
                 return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return PlaylistTileScreen();
                    },));
                  },
                  child: tile(context));
               },),
          )
          ],
        ),
      ),
    );
  }



}

