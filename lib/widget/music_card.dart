 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container musicCard(
    {
      required String cardName,
      required IconData icon,
      required BuildContext context
    }
  ) {
    return Container(
           width:MediaQuery.of(context).size.width * 0.38,
           height: MediaQuery.of(context).size.height * 0.16,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16),
               gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFCCCCCC), Color(0xFF999999)],
                stops: [0, 0.5])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFD9D9D9),
                    child: Icon(icon,size: 25,color: Colors.black,),
                    radius: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(cardName,style: GoogleFonts.crimsonPro(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF545252)),),
                    )
                    ],
                )
             );
  }