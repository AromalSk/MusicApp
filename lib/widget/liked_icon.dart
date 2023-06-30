import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconGradient extends StatelessWidget {
  double sizeOf;
   IconGradient({super.key,required this.sizeOf});

  
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
        size: MediaQuery.of(context).size.height * sizeOf,
        color: Colors.white,
      ),
    );
  }
}


