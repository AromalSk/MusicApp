import 'package:flutter/material.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/playlist_add_tile.dart';


playlistBottomSheet(BuildContext context,playLsitName1 ,int idx) {
  return showModalBottomSheet(
    
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child:
        Padding(
          padding: const EdgeInsets.only(top :8.0),
          child: ListView.builder(itemBuilder: (context, index) {
            
            return PlaylistAddingTileBottom(
             PlayListName:playLsitName1 ,
             idx: idx,
             index: index,
             Songname: Songall[index].name!,
            );
          },
          itemCount: Songall.length,
          ),
        )
        
        
      );
    },
  );
}