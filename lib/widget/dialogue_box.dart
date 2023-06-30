 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/model/playlist/playlist_function.dart';

void openDialog(BuildContext context) {
final formkey = GlobalKey<FormState>();
  var playlistController = TextEditingController();
    showDialog(context: context, builder: (context) {
     return AlertDialog(
      backgroundColor: Colors.grey,
        title: Text("Create new playlist",style: GoogleFonts.crimsonPro(color: Colors.black,fontWeight: FontWeight.w600)),
        content: Form(
          key: formkey,
          child: TextFormField(
            
            // ignore: body_might_complete_normally_nullable
            validator: (value) {
               if (playlistController.text.trim().isEmpty ||
                                PlayListNotifier.value.any((playlist) =>
                                    playlist.name == playlistController.text)) {
                              return 'Name is empty or already present';
                            }
            },
            decoration: const InputDecoration(),
            controller: playlistController,
          ),
        ),
        actions: [
          
           TextButton(onPressed: (){ Navigator.of(context).pop();}, child: Text("Cancel",style: GoogleFonts.crimsonPro(color: Colors.black,fontWeight: FontWeight.w600),)),
          TextButton(onPressed: (){
               if (formkey.currentState!.validate()) {
                 createPlayList(playlistController.text);
                                            
                              playlistController.clear();
                            Navigator.of(context).pop();

                            }
           
          }, child: Text("Create",style: GoogleFonts.crimsonPro(color: Colors.black,fontWeight: FontWeight.w600),))
        ],
      );
    },);
  }