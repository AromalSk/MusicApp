

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_main/functions/play_music.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/screens/song_screen.dart';
import 'package:project_main/screens/splash_screen.dart';
import 'package:project_main/widget/favourite_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  // ignore: prefer_final_fields, unused_field
  AssetsAudioPlayer _audioplayer = AssetsAudioPlayer.withId('0');
  List<Audio> allsongs = [];
  final box = SongBox.getinstance();
  late List<SongDetails> dbSongs;

  @override
  void initState() {
    dbSongs = box.values.toList();
    for (var item in dbSongs) {
      allsongs.add(Audio.file(item.songUrl!,
          metas: Metas(
              title: item.name, artist: item.artist, id: item.id.toString())));
    }
    super.initState();
  }

  // ignore: non_constant_identifier_names
  late List<SongDetails> DBSongs = List.from(dbSongs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              color: const Color.fromARGB(255, 239, 116, 81),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: searchcontroller,
                      onChanged: (value) => searchList(value),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
//---------------------(search History)-----------------------------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Songall.isEmpty
                    ? const Center(
                        child: Text(
                          'Not found',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (ctx, index) {
                          SongDetails songz = DBSongs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      playingList.add(Audio(Songall[index].songUrl!));
                      return  ValueListenableBuilder(valueListenable: favDbObject.listenable(), builder: (context, value, child) {
                   bool contains=favDbObject.values.where((element) => element.id==Songall[index].id).isEmpty;
                     return SongScreen(id: Songall[index].id!,isFav: contains,index: index,);
                    },
                    );
                    }
                        ));
                            },
                            child: FavTile(name: songz.name!,
                             artist: songz.artist!,
                              id: songz.id!,
                               duration: songz.duration!,
                               index: index,
                               ),
                          );
                          // return ListTile(
                          //     onTap: (() {
                          //       _audioplayer.open(
                          //           Playlist(
                          //               audios: allsongs, startIndex: index),
                          //           showNotification: true,
                          //           headPhoneStrategy:
                          //               HeadPhoneStrategy.pauseOnUnplug,
                          //           loopMode: LoopMode.playlist);
                               
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: ((context) =>
                          //                   SongScreen(index: 0,isFav: true,id: index,))));
                          //     }),
                          //     title: Text(
                          //       songz.name!,
                          //       maxLines: 1,
                          //       overflow: TextOverflow.ellipsis,
                          //       style: const TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.w500),
                          //     ),
                          //     leading: QueryArtworkWidget(
                          //       id: songz.id!,
                          //       type: ArtworkType.AUDIO,
                          //       artworkQuality: FilterQuality.high,
                          //       artworkBorder: BorderRadius.circular(50),
                          //       nullArtworkWidget: ClipRRect(
                          //         child: Image.asset(
                          //           'assets/Image/StBrARCw_400x400.jpg',
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ));
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider();
                        },
                        itemCount: DBSongs.length),
              ),
            )
          ],
        ));
  }

  void searchList(String value) {
    setState(() {
      DBSongs = dbSongs
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      allsongs.clear();
      for (var item in DBSongs) {
        allsongs.add(
          Audio.file(
            item.songUrl.toString(),
            metas: Metas(
              artist: item.artist,
              title: item.name,
              id: item.id.toString(),
            ),
          ),
        );
      }
    });
  }
}





