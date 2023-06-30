
import 'package:flutter/material.dart';
import 'package:project_main/screens/dummt.dart';
import 'package:project_main/screens/home_screen.dart';

import 'package:project_main/screens/shazam_screen.dart';

import 'package:project_main/widget/miniplayer.dart';
import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {

  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

   int currentIndex = 1;
   final screens = [
    const ShazamScreen(),
    // const ArtistScreen(),
    const HomeScreen(),
    const SearchScreenPage(),
    
   ];
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(   
      body: screens[currentIndex], 
  bottomNavigationBar: 
  
   SuperBottomNavigationBar(
    height: 65,
    backgroundColor: Colors.black,
    // selectedItemColor: Colors.white,
    // unselectedItemColor: Colors.grey,
        elevation: 0,
        currentIndex: currentIndex,
        onSelected: (index) => setState(() => currentIndex = index), 
        items: const [
        // BottomNavigationBarItem(icon: Icon(Icons.bolt,),label: "Shazam",backgroundColor: Colors.white),
        //  BottomNavigationBarItem(icon: Icon(Icons.person),label: "Artist",backgroundColor: Colors.black),
          // BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.white,),
          //  BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",backgroundColor: Colors.white),

           SuperBottomNavigationBarItem(unSelectedIcon: Icons.bolt,selectedIcon: Icons.bolt,splashColor: Colors.white,borderBottomColor:Colors.white,backgroundShadowColor: Colors.white,selectedIconColor:  Colors.white),
            SuperBottomNavigationBarItem(unSelectedIcon: Icons.home_outlined,selectedIcon: Icons.home,splashColor: Colors.white,borderBottomColor:Colors.white,backgroundShadowColor: Colors.white,selectedIconColor:  Colors.white),
             SuperBottomNavigationBarItem(unSelectedIcon: Icons.search,selectedIcon: Icons.search,splashColor: Colors.white,borderBottomColor:Colors.white,backgroundShadowColor: Colors.white,selectedIconColor:  Colors.white)
          

      ]),
     bottomSheet: const MiniPlayer(),
    );
  }
}










  // bottomNavigationBar: BottomNavigationBar(
  //       elevation: 0,
  //       currentIndex: currentIndex,
  //       onTap: (index) => setState(() => currentIndex = index), 
  //       items: [
  //       BottomNavigationBarItem(icon: Icon(Icons.bolt),label: "Shazam",backgroundColor: Colors.black),
  //        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Artist",backgroundColor: Colors.black),
  //         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.black),
  //          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",backgroundColor: Colors.black),
          

  //     ]),