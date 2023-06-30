import 'package:flutter/material.dart';

class IconGradientPlayingScreen extends StatelessWidget {
  const IconGradientPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color(0xFFCB11A6), Color(0xFF7F04AD),Color(0xFF6600BE)],
          stops: [.4,.75,.99],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Icon(
        Icons.favorite_rounded,
        size: MediaQuery.of(context).size.height * 0.05,
        color: Colors.white,
      ),
    );
  }
}


