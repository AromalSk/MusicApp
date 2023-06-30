import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_main/model/playlist/playlist_function.dart';
import 'package:project_main/screens/splash_screen.dart';

// ignore: must_be_immutable
class PlaylistAddingTileBottom extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String Songname;
  int index;
int idx;
// ignore: non_constant_identifier_names
String PlayListName;
  // ignore: non_constant_identifier_names
  PlaylistAddingTileBottom({super.key,required this.Songname,required this.index,required this.idx,required this.PlayListName});

  @override
  State<PlaylistAddingTileBottom> createState() => _PlaylistAddingTileBottomState();
}

class _PlaylistAddingTileBottomState extends State<PlaylistAddingTileBottom> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                  QueryArtworkWidget(
                  artworkHeight: MediaQuery.of(context).size.width * .15,
                  artworkWidth: MediaQuery.of(context).size.width * .15,
                  id: Songall[widget.index].id!,
                  type: ArtworkType.AUDIO,
                  artworkFit: BoxFit.cover,
                  artworkQuality: FilterQuality.high,
                  size: 2000,
                  quality: 100,
                  artworkBorder: BorderRadius.circular(50),
                  nullArtworkWidget:  Container(
                  height: MediaQuery.of(context).size.width * .15,
                  width: MediaQuery.of(context).size.width * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image:  AssetImage('asset/apple-music-note.jpg'),fit: BoxFit.cover)),
                  
                 ),
                  ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .55,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.Songname,
                        style: GoogleFonts.crimsonPro(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            
                            ),
                             overflow: TextOverflow.ellipsis,
                            ),
                    const Row(
                      children: [
                        // Text(,
                        //     style: GoogleFonts.crimsonPro(
                        //         color: const Color.fromARGB(255, 221, 221, 221),
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w500)),
                        // const Padding(
                        //   padding: EdgeInsets.only(
                        //       top: 5, left: 10, right: 10),
                        //   child: CircleAvatar(
                        //       radius: 3,
                        //       backgroundColor:
                        //           Color.fromARGB(255, 221, 221, 221)),
                        // ),
                        // Text(formatDuration(duration),
                        //     style: GoogleFonts.crimsonPro(
                        //         color: const Color.fromARGB(255, 221, 221, 221),
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ),
            ),
              ],
            ),          
            Row(
              
              children: [
                GestureDetector(
                    onTap: () {
                      // addSongToPlayList(Songall[widget.index], widget.PlayListName);
                      // PlayListNotifier.value[widget.idx].container.insert(0, Songall[widget.index]);
                      // addSongToPlayList(song, playListName)
                      setState(() {
              if (!PlayListNotifier.value[widget.idx].container
                  .contains(Songall[widget.index])) {
                PlayListNotifier.value[widget.idx].container
                    .insert(0, Songall[widget.index]);
                addSongToPlayList(Songall[widget.index], widget.PlayListName);
              } else {
                PlayListNotifier.value[widget.idx].container
                    .remove(Songall[widget.index]);
                removeSongfromPlayList(
                    Songall[widget.index], widget.PlayListName);
              }
            });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right :25.0),
                      child: !PlayListNotifier.value[widget.idx].container
                  .contains(Songall[widget.index])
              ?  const Icon(Icons.add)
              :  const Icon(Icons.remove))
                    )
                    
              ],
            )
          ],
        ),
      ),
    );
  }
}