import 'package:assets_audio_player/assets_audio_player.dart';
import '../model/model.dart';
import '../screens/home_screen.dart';



List<Audio> playingList = [];

playMusic(int index, List<SongDetails> songs) async {
  playingList.clear();
  
  for (var element in songs) {
   
    playingList.add(Audio.file(element.songUrl!,
        metas: Metas(
            title: element.name,
            artist: element.artist,
            id: element.id.toString())));
    
  }

  await player.open(Playlist(audios: playingList, startIndex: index, ),showNotification: true
  );
player.setLoopMode(LoopMode.playlist);
 
}

