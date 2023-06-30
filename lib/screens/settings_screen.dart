import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_main/screens/about_us.dart';
import 'package:project_main/screens/privacy_policy.dart';
import 'package:project_main/screens/terms_conditions_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Settings",style: GoogleFonts.crimsonPro(fontSize: 24,fontWeight: FontWeight.w600),),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'About Us'),
            Tab(text: 'Privacy Policy',),
            Tab(text: 'Terms and condition',)
          ]),
        ),
        body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color.fromARGB(255, 64, 64, 64), Colors.black],
                stops: [0, 0.5])),
                child: const TabBarView(children: [
                  AboutUs(),
                  PrivacyPolicy(),
                  TermsAndConditions()
                ]),
                ),
               
      ),
    );
  }
}