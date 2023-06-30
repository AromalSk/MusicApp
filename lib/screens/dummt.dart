import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/favourite_tile.dart';



final searchcontroller = TextEditingController();
List<SongDetails> searchsongs = List.from(Songall);
// List<Songs> dbsongs = listall;
List<Audio> allsongsin = [];

class SearchScreenPage extends StatefulWidget {
  const SearchScreenPage({super.key});

  @override
  State<SearchScreenPage> createState() => _SearchScreenPageState();
}

class _SearchScreenPageState extends State<SearchScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Colors.black, Color(0xFFb1b1b1)],
                stops: [0.5, 1])),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: Text(
                        "Search",
                        style: GoogleFonts.crimsonPro(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: searchcontroller,
                  onChanged: (value) {
                    search(searchcontroller.text);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                
                child: searchsongs.isEmpty ? searchEmpty() : ListView.builder(
                  
                  shrinkWrap: true,
                  itemCount: searchsongs.length,
                  itemBuilder: (context, index) {
                    return 
                   
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                           playMusic(index, searchsongs); 
                            bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                          return SongScreen(isFav: contains, id: searchsongs[index].id!, index: index);
                        },));
                      },
                      child: FavTile(name: searchsongs[index].name!,
                       artist: searchsongs[index].artist!,
                        id: searchsongs[index].id!,
                         duration: searchsongs[index].duration!,
                         index: index,
                         
                         ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  search(String value) {
    setState(() {
      searchsongs = Songall.where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase().trim()))
        .toList();
    for (SongDetails elements in searchsongs) {
      allsongsin.add(Audio.file(elements.songUrl.toString(),
          metas: Metas(title: elements.name, id: elements.id.toString())));
    }
    });
     for (var i = 0; i < searchsongs.length; i++) {
      log(searchsongs[i].name!);
    }
  }
}

searchEmpty() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "No results found",
        style: GoogleFonts.crimsonPro(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic),
      ),
      Text("Try Searching for your favourite music",
          style: GoogleFonts.crimsonPro(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic))
    ],
  ));
}
