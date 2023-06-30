// ignore_for_file: invalid_use_of_visible_for_testing_member, duplicate_ignore

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/widget/liked_icon.dart';

// ignore: must_be_immutable
class FavIcon extends StatefulWidget {
  int id;
  bool isFav;
  FavIcon({super.key, required this.id, required this.isFav});

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // ignore: duplicate_ignore
          if (!widget.isFav) {
            log('----widget is fav is true-----');

            log(widget.isFav.toString());
            widget.isFav = false;
            removeFromFav(widget.id);

            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            FavouriteNotifier.notifyListeners();
            const snackBar = SnackBar(
               backgroundColor: Colors.red,
              content: Text("Removed from Favourites"));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            log('----widget is fav is false-----');

            widget.isFav = true;
            log(widget.isFav.toString());

            addToFav(widget.id);

        
           
            // ignore: invalid_use_of_protected_member
            FavouriteNotifier.notifyListeners();
            const snackBar1 = SnackBar(
               backgroundColor: Colors.blueAccent,
              content: Text("Added to favourite"));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar1);
          }
        },
        child: !widget.isFav
            ? IconGradient(sizeOf: 0.031,)
            : const Icon(Icons.favorite_border_outlined));
  }
}
