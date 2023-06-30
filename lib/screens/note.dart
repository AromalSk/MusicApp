

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:tune_spot/screens/playscreeen.dart';
// import 'package:tune_spot/screens/splash-screen.dart';

// import '../model/songs_model.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController searchcontroller = TextEditingController();
//   AssetsAudioPlayer _audioplayer = AssetsAudioPlayer.withId('0');
//   List<Audio> allsongs = [];
//   final box = SongBox.getinstance();
//   late List<SongDetails> dbSongs;

//   @override
//   void initState() {
//     dbSongs = box.values.toList();
//     for (var item in dbSongs) {
//       allsongs.add(Audio.file(item.songUrl,
//           metas: Metas(
//               title: item.name, artist: item.artist, id: item.id.toString())));
//     }
//     super.initState();
//   }

//   late List<SongDetails> DBSongs = List.from(dbSongs);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 60,
//             ),
//             Container(
//               color: const Color.fromARGB(255, 239, 116, 81),
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: Icon(Icons.arrow_back)),
//                   Container(
//                     width: 200,
//                     child: TextFormField(
//                       controller: searchcontroller,
//                       onChanged: (value) => searchList(value),
//                       keyboardType: TextInputType.name,
//                       textInputAction: TextInputAction.done,
//                       decoration: InputDecoration(
//                           hintText: 'Search',
//                           hintStyle: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
// //---------------------(search History)-----------------------------------------
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: ListOfSongs.isEmpty
//                     ? const Center(
//                         child: Text(
//                           'Not found',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )
//                     : ListView.separated(
//                         itemBuilder: (ctx, index) {
//                           SongDetails songz = DBSongs[index];
//                           return ListTile(
//                               onTap: (() {
//                                 _audioplayer.open(
//                                     Playlist(
//                                         audios: allsongs, startIndex: index),
//                                     showNotification: true,
//                                     headPhoneStrategy:
//                                         HeadPhoneStrategy.pauseOnUnplug,
//                                     loopMode: LoopMode.playlist);
//                                 setState(() {});
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: ((context) =>
//                                             PlayingScreen(index: 0))));
//                               }),
//                               title: Text(
//                                 songz.name,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               leading: QueryArtworkWidget(
//                                 id: songz.id,
//                                 type: ArtworkType.AUDIO,
//                                 artworkQuality: FilterQuality.high,
//                                 artworkBorder: BorderRadius.circular(50),
//                                 nullArtworkWidget: ClipRRect(
//                                   child: Image.asset(
//                                     'assets/Image/StBrARCw_400x400.jpg',
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ));
//                         },
//                         separatorBuilder: (ctx, index) {
//                           return Divider();
//                         },
//                         itemCount: DBSongs.length),
//               ),
//             )
//           ],
//         ));
//   }

//   void searchList(String value) {
//     setState(() {
//       DBSongs = dbSongs
//           .where((element) =>
//               element.name.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//       allsongs.clear();
//       for (var item in DBSongs) {
//         allsongs.add(
//           Audio.file(
//             item.songUrl.toString(),
//             metas: Metas(
//               artist: item.artist,
//               title: item.name,
//               id: item.id.toString(),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }














// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//       height: double.infinity,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: AlignmentDirectional.bottomCenter,
//               colors: [ Colors.black,Color(0xFFb1b1b1)],
//               stops: [0.5, 1])),
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                      Row(
//                       children: [
//                         Icon(Icons.arrow_back_ios,color: Colors.white,),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 130),
//                           child: Text("Search",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600),),
//                         )
//                       ],
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 15),
//                        child: TextFormField(                     
//                                      decoration: InputDecoration(
//                                        filled: true,
//                                        fillColor: Colors.grey,
//                                        suffixIcon: Icon(Icons.search),
//                                        border: OutlineInputBorder(
//                                          borderSide: BorderSide.none,
//                                          borderRadius: BorderRadius.circular(100), 
//                                        ),
//                                      ),),
//                      ),
//                      SizedBox(height: 200,),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Text("No results found",style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),),
//                      Text("Try Searching for your favourite music",style:GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic))
//                       ],
//                     )
                    
//                     ],
//                   ),
//                 ),
//               ),
//               ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: AlignmentDirectional.bottomCenter,
//                   colors: [Color(0xFFb1b1b1), Colors.black],
//                   stops: [0, 0.5])),
//           child:  
//            Column(
//              children: [
//                Container(
//                 padding: EdgeInsets.only(left: 30,top: 10,right: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "My Music",
//                       style: TextStyle(fontSize: 24, color: Colors.white),
//                     ),
//                     SizedBox(height: 40,),
//                   GridView.builder(
//                      physics: NeverScrollableScrollPhysics(),
//                      shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 20,
//                     childAspectRatio: 1.2,
//                     crossAxisSpacing: 20,
//                     ), 
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       if (index == 0) {
//                         return  musicCard(cardName: "Playlist",icon: Icons.queue_music_rounded);
//                       }else if(index == 1){
//                         return musicCard(cardName: "Most Played", icon: Icons.repeat_one_outlined);
//                       }else if(index == 2){
//                         return musicCard(cardName: "Favorites", icon: Icons.favorite_outlined);
//                       }else if(index == 3){
//                         return musicCard(cardName: "Recently Played", icon: Icons.access_time_filled_outlined);
//                       }
//                     },                
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20,left: 10,bottom: 20),
//                       child: Text("All Songs",style: TextStyle(color: Colors.white),),
//                     ),              
//                   ],
//                 ),
//           ),
//          Expanded(
//            child: Container(
//              child: ListView.builder(
//                physics: NeverScrollableScrollPhysics(),
//                      shrinkWrap: true,
//               itemCount: 50,
//               itemBuilder: (context, index) {
//                return musicTiles();
//              },),
//            ),
//          )
          
//              ],
//            ), 
                   
//         ), 
//       ),
//     );
//   }

//   Container musicCard(
//     {
//       required String cardName,
//       required IconData icon
//     }
//   ) {
//     return Container(
//               height: 125,
//               width: 150,
//               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16),
//                gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [Color(0xFFCCCCCC), Color(0xFF999999)],
//                 stops: [0, 0.5])),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Color(0xFFD9D9D9),
//                     child: Icon(icon,size: 25,color: Colors.black,),
//                     radius: 25,),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 7),
//                       child: Text(cardName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF545252)),),
//                     )
//                     ],
//                 )
//              );
//   }
// }

// class musicTiles extends StatelessWidget {
//   const musicTiles({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(           
//       height: 100,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft ,
//           end: Alignment.bottomRight,
//           colors: [Color.fromARGB(255, 173, 173, 173),Color(0xFFc3c3c3),Color(0xFFDBDBDB),Color(0xFFc3c3c3)],
//           stops: [0.3,0.6,0.7,0.9]
//           ),
//           borderRadius: BorderRadius.circular(10)
//           ),
//          child: Row(
//            children: [
//              Padding(
//                padding: const EdgeInsets.only(left: 15),
//                child: Container(
//                 height: 80,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: NetworkImage('https://images.macrumors.com/t/hi1_a2IdFGRGMsJ0x31SdD_IcRk=/1600x/article-new/2018/05/apple-music-note.jpg'),fit: BoxFit.cover)),
                
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(left : 12),
//                child: Container(
//                 width: 215,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("STAY"),
//                     Row(
//                       children: [
//                           Text("Justin beiber"),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 6,left: 10,right: 10),
//                             child: CircleAvatar(radius: 2,backgroundColor: Colors.black,),
//                           ),
//                           Text("2:34")
//                       ],
//                     )
                   
//                   ],
//                 ),
//                ),
               
//              ),
//              Container(
//               child: Row(
//                 children: [
//                   Icon(Icons.favorite_rounded),
//                   Icon(Icons.more_vert)
//                 ],
//               ),
//              )
//            ],
//          ),
//     );
//   }
// }


