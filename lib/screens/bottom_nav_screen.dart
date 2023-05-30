import 'package:flutter/material.dart';
import 'package:project_main/screens/artist_screen.dart';
import 'package:project_main/screens/home_screen.dart';
import 'package:project_main/screens/search_screen.dart';
import 'package:project_main/screens/settings_screen.dart';
import 'package:project_main/screens/shazam_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
   int currentIndex = 2;
   final screens = [
    ShazamScreen(),
    ArtistScreen(),
    HomeScreen(),
    SearchScreen(),
    
   ];
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index), 
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.bolt),label: "Shazam",backgroundColor: Colors.black),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Artist",backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.black),
           BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",backgroundColor: Colors.black),
          

      ]),
    );
  }
}