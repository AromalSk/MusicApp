import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFE5E5E5), Color(0xFF1C1C1C)],
                  stops: [0, 0.99])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://wallpapercave.com/wp/wp6489872.png'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "01:23",
                    style: GoogleFonts.crimsonPro(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Taylor Swift - RED",style: GoogleFonts.crimsonPro(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.shuffle_rounded,color: Colors.white,)),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 40,
                           bottom: 15,
                          child: Container(
                            height: 55,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Icon(Icons.fast_forward_rounded),
                                    ),
                          ),
                        ),
                         Positioned(
                          right: 40,
                          bottom: 15,
                          child: Container(
                            height: 55,
                            width: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: Icon(Icons.fast_rewind_rounded),
                                    ),
                          ),
                        ),
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color:  Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(100)),
                              child: Icon(Icons.play_arrow,color: Colors.white,size: 50,),
                        ),
                       
                      ],
                    ),
                  
                    IconButton(onPressed: () {}, icon: Icon(Icons.repeat,color: Colors.white,))
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
