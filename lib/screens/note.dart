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


