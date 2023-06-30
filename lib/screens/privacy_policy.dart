import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                      child: Text('''At Death Note, we value your privacy and are committed to protecting the personal information you entrust to us. This Privacy Policy outlines how we collect, use, and safeguard your data when you use our music player.
                    
                    When you use Death Note, we may collect certain information to provide you with a personalized and optimized music experience. This information may include your device information, such as the model, operating system, and unique device identifiers. We may also collect data about your usage patterns, including the songs you listen to, playlists you create, and interactions with the player's features. This information helps us improve our services and tailor them to your preferences.
                    
                    We understand the importance of securing your personal data, and we implement industry-standard security measures to protect it. We use encryption technology to safeguard your information during transmission and store it securely on our servers. We also restrict access to your data to authorized personnel only and regularly update our security protocols to maintain the highest level of protection.
                    
                    At Death Note, we are committed to transparency and will never sell or share your personal information with third parties for marketing purposes without your explicit consent. However, we may share your data with trusted service providers who assist us in delivering our services, such as cloud storage providers or analytics platforms. These service providers are bound by strict confidentiality obligations and are prohibited from using your information for any purpose other than providing the agreed-upon services.
                    
                    While Death Note takes reasonable measures to protect your data, it is important to note that no method of transmission or storage is 100% secure. Therefore, we cannot guarantee the absolute security of your information. We encourage you to take precautions on your end, such as using strong and unique passwords, and keeping your device's software up to date.
                    
                    Our music player may contain links to third-party websites or services that are not owned or controlled by Death Note. We are not responsible for the privacy practices of these third parties, and we encourage you to review their privacy policies before providing any personal information.
                    
                    If you have any questions or concerns regarding our Privacy Policy or the handling of your data, please contact us through the provided channels. We may update this Privacy Policy from time to time, and any changes will be communicated to you through appropriate means. By using Death Note, you consent to the collection and processing of your data as outlined in this Privacy Policy.
                    
                    In summary, we respect your privacy and are committed to protecting your personal information. We collect and use your data to enhance your music experience, implement robust security measures, and do not sell or share your information without your consent. We encourage you to review our Privacy Policy and contact us if you have any inquiries.''',
                    style:  GoogleFonts.crimsonPro(color: Colors.white,fontSize: 18),),
                    ),
                  ],
                ),
                ),
                
    );
  }
}