import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color.fromARGB(255, 111, 111, 111), Colors.black],
                stops: [0, 0.5])),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('''By using the Death Note music player, you agree to the following terms and conditions:
                    
                    License: Death Note grants you a limited, non-exclusive, and non-transferable license to use the music player for personal, non-commercial purposes. This license is subject to your compliance with these terms and conditions.
                    
                    Intellectual Property: All intellectual property rights related to the Death Note music player, including software, design, trademarks, and content, are owned by Death Note or its licensors. You agree not to modify, distribute, or create derivative works based on the music player without prior written permission.
                    
                    User Obligations: You are responsible for maintaining the confidentiality and security of your Death Note account and any associated passwords. You agree not to use the music player for any unlawful or unauthorized purposes, and you will comply with all applicable laws and regulations.
                    
                    User-Generated Content: Death Note may allow you to submit or share user-generated content, such as playlists or comments. By doing so, you grant Death Note a non-exclusive, royalty-free, worldwide license to use, reproduce, modify, and distribute your content for the purposes of providing and promoting the music player.
                    
                    Privacy: Your use of the Death Note music player is subject to the Privacy Policy, which outlines how we collect, use, and protect your personal information. By using the music player, you consent to the collection and processing of your data as described in the Privacy Policy.
                    
                    Termination: Death Note reserves the right to suspend or terminate your access to the music player at any time, without prior notice, for any reason. You may also terminate your use of the music player at any time by discontinuing its use.
                    
                    Limitation of Liability: Death Note and its affiliates shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of the music player, including but not limited to any loss of data, interruption of service, or loss of profits.
                    
                    Governing Law: These terms and conditions shall be governed by and construed in accordance with the laws of [Jurisdiction]. Any disputes arising from or relating to these terms and conditions shall be subject to the exclusive jurisdiction of the courts in [Jurisdiction].
                    
                    Please carefully review these terms and conditions before using the Death Note music player. Your continued use of the music player signifies your acceptance of these terms and conditions. If you do not agree with any part of these terms, please refrain from using the music player.''',
                    style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18)),
                    ),
                  ],
                ),
                ),
                
    );
  }
}