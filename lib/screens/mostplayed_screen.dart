import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/widget/most_played_tile.dart';


class MostPlayedScreen extends StatelessWidget {
  const MostPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text("Most played",
      style: GoogleFonts.crimsonPro(
                     color: Colors.black,
                     fontSize: 24,
                     fontWeight: FontWeight.w600)),
                     elevation: 0,
                    backgroundColor: Color.fromARGB(15, 255, 255, 255),
                     centerTitle: true,
                      leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                     
                     ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width:double.infinity, 
        decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color(0xFFFDFDFD), Colors.black],
                    stops: [0, 0.6])),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ),
                child: ListView(
                
                  children: [
                   
                    SizedBox(height: 10,),
                    Container(
                     height: 200,
                     width: 340,                  
                     decoration: BoxDecoration( color: Color.fromRGBO(255, 255, 255, 0.07),
                     borderRadius: BorderRadius.circular(20),
                     ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 125,
                            width: 120,
                              
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("https://images6.fanpop.com/image/photos/38400000/-Ed-Sheeran-ed-sheeran-38449142-300-431.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Most Played Song",style: GoogleFonts.crimsonPro(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),
                              SizedBox(height: 5,),
                              Text("Photograph",style: GoogleFonts.crimsonPro(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white),),
                              SizedBox(height: 5,),
                              Text("Ed-Sheeran - 1000 plays",style: GoogleFonts.crimsonPro(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,                          
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,), 
                                      child: Icon(Icons.pause),    
                                  ),
                                  SizedBox(width: 10,),
                                   Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,),
                                      child: Icon(Icons.favorite), 
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text("Top Songs",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                    ),
                   mostPlayedTile(),
                  mostPlayedTile(),
                  mostPlayedTile(),
                  mostPlayedTile(),
                  mostPlayedTile(),
                  mostPlayedTile(),
                  mostPlayedTile(),

                  ],
                ),
              ),
            ),
      ),
    );
  }



  
}