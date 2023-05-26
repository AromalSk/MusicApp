  import 'package:flutter/material.dart';

Container artistTile() {
    return Container(
      height: 225,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage("https://i.quotev.com/t6rskyudaaaa.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }