import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/model/model.dart';
import 'package:project_main/model/playlist/playlist_function.dart';
import 'package:project_main/screens/playlist_tile_screen.dart';

class AddToPlaylistScreen extends StatefulWidget {
  final SongDetails song;

  const AddToPlaylistScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<AddToPlaylistScreen> createState() => _AddToPlaylistScreenState();
}

class _AddToPlaylistScreenState extends State<AddToPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Playlists",
          style: GoogleFonts.crimsonPro(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(76, 80, 80, 80),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color.fromARGB(255, 201, 201, 201), Colors.black],
              stops: [0, 0.55],
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: PlayListNotifier,
                      builder: (context, value, child) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: PlayListNotifier.value.length,
                          itemBuilder: (context, index) {
                            final playlist = PlayListNotifier.value[index];
                            final songExists = playlist.container.any((song) => song.id == widget.song.id);

                            return GestureDetector(
                              onTap: () {
                                if (!songExists) {
                                  addSongToPlayList(widget.song, playlist.name);
                                  playlist.container.add(widget.song);
                                }

                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return PlaylistTileScreen(
                                      indexs: index,
                                      title: '',
                                    );
                                  }),
                                );
                              },
                         child: Padding(
                           padding: const EdgeInsets.only(bottom: 10),
                           child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      playlist.name,
                                      style: GoogleFonts.crimsonPro(color: Colors.white, fontSize: 24),
                                    ),
                                    trailing: const Icon(Icons.add, color: Colors.white),
                                  ),),
                         )
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
