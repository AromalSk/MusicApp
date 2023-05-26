import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
              colors: [ Colors.black,Color(0xFFb1b1b1)],
              stops: [0.5, 1])),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                     Row(
                      children: [
                        Icon(Icons.arrow_back_ios,color: Colors.white,),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: Text("Search",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600),),
                        )
                      ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 15),
                       child: TextFormField(                     
                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.grey,
                                       suffixIcon: Icon(Icons.search),
                                       border: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                         borderRadius: BorderRadius.circular(100), 
                                       ),
                                     ),),
                     ),
                     SizedBox(height: 200,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("No results found",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),),
                     Text("Try Searching for your favourite music",style:GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic))
                      ],
                    )
                    
                    ],
                  ),
                ),
              ),
              ),
    );
  }
}