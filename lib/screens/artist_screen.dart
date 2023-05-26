import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/screens/artist_main_screen.dart';
import 'package:project_main/widget/artist_tile.dart';


class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Colors.black, Color(0xFFb1b1b1)],
            stops: [0.5, 1],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Text(
                          "Artist",
                          style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
               SizedBox(height: 100,),
                Container(
                  height: 350,
                  width: double.infinity,
                  child: ListView.builder(          
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return ArtistMainScreen();
                            },));
                          },
                          child: artistTile()),
                      );
                    },
                  ),
                ),
  
               
              ],
            ),
          ),
        ),
      ),
    );
  }


}