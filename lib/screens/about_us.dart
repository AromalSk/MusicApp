import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
                      child: Text('''Death Note is a cutting-edge music player that brings a unique and immersive audio experience to music lovers. Designed for the discerning listeners who seek a seamless fusion of technology and art, Death Note embodies sophistication and innovation. With its sleek and minimalist design, this portable music player is a testament to both form and function, providing a visually stunning and user-friendly interface.

Death Note boasts state-of-the-art audio technology, delivering uncompromising sound quality that transcends conventional boundaries. Equipped with high-resolution audio capabilities, this player reproduces music with exceptional clarity, allowing users to appreciate the subtle nuances and intricate details of their favorite tracks. Its advanced digital-to-analog converter ensures accurate and faithful sound reproduction, faithfully preserving the artist's original intentions.

Beyond its impressive audio performance, Death Note offers a plethora of features that cater to diverse music preferences. With its expansive storage capacity, users can carry an extensive music library wherever they go, ensuring that they never have to compromise on their favorite tunes. The player supports a wide range of audio formats, including lossless formats, enabling audiophiles to enjoy their music collection in the highest possible quality.

The user interface of Death Note is intuitive and user-friendly, providing effortless navigation through music libraries and playlists. Its vibrant high-resolution touchscreen display allows users to browse through album covers, view song information, and customize settings with ease. The player's seamless integration with popular music streaming platforms allows users to access millions of songs and curated playlists at their fingertips, offering an unparalleled music discovery experience.

Death Note also takes connectivity to new heights, featuring Bluetooth and Wi-Fi capabilities. Users can effortlessly connect wireless headphones or speakers to enjoy their music without the hassle of tangled cables. The player's Wi-Fi connectivity enables seamless synchronization with online music services and firmware updates, ensuring a constantly evolving and optimized music experience.

Designed with portability in mind, Death Note is compact and lightweight, making it the perfect companion for music enthusiasts on the go. Its robust battery life ensures hours of uninterrupted listening pleasure, allowing users to immerse themselves in their favorite music wherever they may be.

In summary, Death Note is not just a music player; it is an audio masterpiece that revolutionizes the way we listen to music. With its exquisite design, unparalleled sound quality, and comprehensive features, it caters to the needs and desires of the most discerning music aficionados. Whether you are an audiophile seeking uncompromising audio fidelity or a casual listener looking to enhance your music experience, Death Note is the ultimate companion that will transport you into a world of sonic bliss.''',
                      style: GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18),
                      ),
                    ),
                  ],
                ),
                ),
                
    );
  }
}