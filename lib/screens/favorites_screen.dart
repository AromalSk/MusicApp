import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/widget/transparent_tile.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title:Text("Favourites",
      style: GoogleFonts.crimsonPro(
                     color: Colors.white,
                     fontSize: 24,
                     fontWeight: FontWeight.w600)),
                     elevation: 0,
                    backgroundColor: Color.fromARGB(76, 80, 80, 80),
                     centerTitle: true,
                      leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
                     
                     ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
         decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color.fromARGB(255, 201, 201, 201), Colors.black],
                    stops: [0, 0.55])),
          child: ListView(
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 20,right: 20),
               child: Container(
                 child: Column(
                   children: [
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Text("Liked by you",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w600))
                      ],
                     ),
                     ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                       return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return SongScreen();
                          },));
                        },
                        child: songTile(context));
                     },)
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }

 
}