 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void openDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
     return AlertDialog(
      backgroundColor: Colors.grey,
        title: Text("Create new playlist",style: GoogleFonts.crimsonPro(color: Colors.black,fontWeight: FontWeight.w600)),
        content: TextFormField(
          decoration: InputDecoration(),
          
        ),
        actions: [
          
           TextButton(onPressed: (){}, child: Text("Cancel",style: GoogleFonts.crimsonPro(color: Colors.black,fontWeight: FontWeight.w600),)),
          TextButton(onPressed: (){}, child: Text("Create",style: GoogleFonts.crimsonPro(color: Colors.black,fontWeight: FontWeight.w600),))
        ],
      );
    },);
  }