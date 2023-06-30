import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_main/model/favourite/favouritefunction.dart';
import 'package:project_main/widget/liked_icon.dart';

// ignore: must_be_immutable
class FavIconPlayingScreen extends StatefulWidget {
  int id;
  bool isFav;
  FavIconPlayingScreen({super.key, required this.id, required this.isFav});

  @override
  State<FavIconPlayingScreen> createState() => _FavIconPlayingScreenState();
}

class _FavIconPlayingScreenState extends State<FavIconPlayingScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.isFav) {
            log('----widget is fav is true-----');

            log(widget.isFav.toString());
            widget.isFav = false;
            removeFromFav(widget.id);

            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            FavouriteNotifier.notifyListeners();
            const snackBar = SnackBar(content: Text("Removed from Favourites"));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            log('----widget is fav is false-----');

            widget.isFav = true;
            log(widget.isFav.toString());

            addToFav(widget.id);

            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            FavouriteNotifier.notifyListeners();
            const snackBar1 = SnackBar(content: Text("Added to favourite"));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar1);
          }
        },
        child: !widget.isFav
            ? IconGradient(sizeOf: 0.05,)
            : const Icon(Icons.favorite_rounded,size: 39,));
  }
}
