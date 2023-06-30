
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_main/screens/addtoplaylist_screen.dart';
import 'package:project_main/screens/splash_screen.dart';

// ignore: must_be_immutable
class ThreeDotsTile extends StatelessWidget {
  int index;
  String name;
 ThreeDotsTile({super.key,required this.index,required this.name});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,))
                  ],
                ),
                const SizedBox(height: 70,),
                SizedBox(
                  height: 200,
                  width: 200,
                  child:   QueryArtworkWidget(
                  artworkHeight: MediaQuery.of(context).size.height * .45,
                  artworkWidth: MediaQuery.of(context).size.width * .9,
                  id: Songall[index].id!,
                  type: ArtworkType.AUDIO,
                  artworkFit: BoxFit.cover,
                  artworkQuality: FilterQuality.high,
                  size: 2000,
                  quality: 100,
                  artworkBorder: const BorderRadius.all(Radius.zero),
                  nullArtworkWidget:      Container(
                    height: MediaQuery.of(context).size.height * .45,
                    width: MediaQuery.of(context).size.width * .9,
                        // height: 370,
                        // width: 200,
                        decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.scdn.co/image/ab67706c0000da849a31b524409b664e6953359f"))),
                      ),
                 ),
                 
                ),
                const SizedBox(height: 10,),
                 SizedBox(
                  width: 300,
                  child: Text(name,style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 24),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
                const SizedBox(height: 100,),
                GestureDetector(
                  onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                     return AddToPlaylistScreen(  song:Songall[index]);
                   },));
                  },
                  child: ListTile(leading:IconButton(onPressed: (){}, icon:const Icon(Icons.add_box_outlined) ,color: Colors.white,),
                  title: const Text("Add to Playlist",style: TextStyle(color: Colors.white),),
                  ),
                ),
                // ListTile(leading: IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.white,)),
                // title: const Text("Edit",style: TextStyle(color: Colors.white),),
                // ),
                ListTile(leading:IconButton(onPressed: (){
                  showDialog(context: context, builder: (context) {
                   return AlertDialog(
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text("Yes")),
                          TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text("No")),
                      ],
                      content: const Text("Do you want to Delete."),
                    );
                  },);
                }, icon: const Icon(Icons.delete_forever,color: Colors.white,)),
                title: const Text("Delete",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}