
   String formatDuration(int duration) {
    Duration d = Duration(milliseconds: duration);
    String minutes = (d.inMinutes).toString().padLeft(2, '0');
    String seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
