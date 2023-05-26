import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/widget/transparent_tile.dart';

class ArtistMainScreen extends StatelessWidget {
  const ArtistMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text("Artist",
      style: GoogleFonts.crimsonPro(
                     color: Colors.white,
                     fontSize: 24,
                     fontWeight: FontWeight.w600)),
                     elevation: 0,
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                     centerTitle: true,
                      leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                     
                     ),
      body: Container(
         height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Colors.black,Color(0xFF535353), ],
                  stops: [0.4, 1])),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView(
                        children: [
                         
                          Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only
                              (bottomRight: Radius.circular(70),
                              bottomLeft: Radius.circular(70)),
                              image: DecorationImage(
                                image: NetworkImage("https://video-images.vice.com/articles/583754f5f0157b1d684800df/lede/illuminati-symbols-michael-jackson-dangerous-album-cover.jpg?crop=1xw:0.5882352941176471xh;0xw,0.07536231884057971xh&resize=1200:*"),fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Text("Michael Jackson",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),),
                              ],
                            ),
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
                  ),
      )
      ,
    );
  }

  
 
}