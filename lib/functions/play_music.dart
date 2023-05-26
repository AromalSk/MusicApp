import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import '../model/model.dart';
import '../screens/home_screen.dart';

// final player = AssetsAudioPlayer();

List<Audio> playingList = [];

playMusic(int index, List<SongDetails> songs) async {
  for (var element in songs) {
    log('adding');
    playingList.add(Audio.file(element.songUrl!,
        metas: Metas(
            title: element.name,
            artist: element.artist,
            id: element.id.toString())));
    log('added');
  }
  await player.open(Playlist(audios: playingList, startIndex: index));
}
