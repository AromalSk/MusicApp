import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/model/playlist/playlist_function.dart';
import 'package:project_main/screens/playlist_tile_screen.dart';
import 'package:project_main/widget/dialogue_box.dart';
import 'package:project_main/widget/playlist_box_tile.dart';


class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color.fromARGB(118, 80, 80, 80),
        elevation: 0,
        title:Text("Playlist",style: GoogleFonts.crimsonPro(
                         color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),centerTitle: true,),
      body: Container(
       decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFb1b1b1),Color.fromARGB(255, 77, 77, 77)],
                  stops: [0, 0.6])),
        child: Column(
          children: [
  //           Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: GestureDetector(
  //     onTap: () {
  //       openDialog(context);
  //     },
  //     child: Container(   
  //       height: 170,  
  //       width: 170,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: Colors.white,
  //                  gradient: const LinearGradient(
  //                   begin: Alignment.topLeft,
  //                   end: Alignment.bottomRight,
  //                   colors: [Color(0xFFDDDDDD), Color(0xFFA1A1A1)],
  //                   stops: [0, 1])),
  //                   child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     const CircleAvatar(
  //                    backgroundColor: Color(0xFFD9D9D9),
  //                     // ignore: sort_child_properties_last
  //                     child: Icon(Icons.add,size: 25,color: Colors.black,),
  //                     radius: 25,),
  //                     Padding(
  //                    padding: const EdgeInsets.only(top: 7),
  //                    child: Text("Add Playlist",style: GoogleFonts.crimsonPro(fontSize: 18,fontWeight: FontWeight.bold,color: const Color(0xFF545252)),),
  //                     )
  //                     ],
  //                 ),
  //             ),
  //   ),
  // ),
          Expanded(
            child: ValueListenableBuilder(valueListenable: PlayListNotifier,
             builder: (context, value, child) {
              if (PlayListNotifier.value.isEmpty) {
                 return Center(child: Text("Add new playlist",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 24),));
              }else{
                return  GridView.builder(
              itemCount: PlayListNotifier.value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
               itemBuilder: (context, index) {
               {
               {
                  return GestureDetector(
                  onTap: () {
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return PlaylistTileScreen(indexs: index,title:PlayListNotifier.value[index].name ,);
                    },));
                  },
                  child:
                  
                  tile(context,PlayListNotifier.value[index].name,index));
                }
                 }
               },);
              }
               
             },),
          )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add,color: Colors.black,),
        onPressed: () {
        
        openDialog(context);
        
      },),
    );
  }
  
 



}



//  onTap: () {
//         openDialog(context);
//       },