import 'package:flutter/material.dart';
import 'package:project_main/screens/home_screen.dart';

class AnimatedPlayPause extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AnimatedPlayPause({super.key});
  @override
  State<AnimatedPlayPause> createState() => _AnimatedPlayPauseState();
}

class _AnimatedPlayPauseState extends State<AnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    iconController.forward();
  }

  bool isAnimated = false;
  bool showPlay = true;
  bool showPause = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animatedIcon();
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: iconController,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  void animatedIcon() {
    setState(() {
      isAnimated = !isAnimated;

      if (isAnimated) {
        iconController.forward();
        player.play();
      } else {
        iconController.reverse();
        player.pause();
      }
    });
  }

// void play(){
//   setState(() {
//     showPause = true;
//     showPlay = false;
//     iconController.forward();
//   });
// }

// void pause(){
//   setState(() {
//     showPause = false;
//     showPlay = true;
//     iconController.reverse();
//   });
// }
}
