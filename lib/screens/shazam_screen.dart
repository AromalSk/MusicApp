import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ShazamScreen extends StatelessWidget {
  const ShazamScreen({super.key});

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
                  colors: [Color(0xFFb1b1b1), Colors.black],
                  stops: [0, 0.5])),
                  child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(300)),
                          child: Icon(Icons.bolt,size: 100,),
                      ),
                      SizedBox(height: 40,),
                      Text("Tap to Shazam",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 48,fontWeight: FontWeight.w600),)
                    ],
                  ),
      ),
      
    );
  }
}