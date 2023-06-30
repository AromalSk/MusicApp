import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';
import 'package:google_fonts/google_fonts.dart';

class ShazamScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ShazamScreen({Key? key});

  @override
  State<ShazamScreen> createState() => _ShazamScreenState();
}

class _ShazamScreenState extends State<ShazamScreen> {
  @override
  void initState() {
    ACRCloud.setUp(
      const ACRCloudConfig(
        'f632b5b4e3004e69e7f9a693006d2393',
        '4hBszI76ML3w2m114JuY8ZQGT5BeWuLuKbuM00xv',
        'identify-ap-southeast-1.acrcloud.com',
      ),
    );
    super.initState();
  }

  ACRCloudResponseMusicItem? music;

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
            colors: [Color(0xFFb1b1b1), Colors.black],
            stops: [0, 0.5],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
              endRadius: 150,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    music = null;
                  });

                  final session = ACRCloud.startSession();

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text('Listening...'),
                      content: StreamBuilder(
                        stream: session.volumeStream,
                        initialData: 0,
                        builder: (_, snapshot) => Text(snapshot.data.toString()),
                      ),
                      actions: [
                        TextButton(
                          onPressed: session.cancel,
                          child: const Text('Cancel'),
                        )
                      ],
                    ),
                  );

                  final result = await session.result;
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  if (result == null) {
                    // Cancelled.
                    return;
                  } else if (result.metadata == null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No result.'),
                    ));
                    return;
                  }

                  setState(() {
                    music = result.metadata!.music.isNotEmpty ? result.metadata!.music.first : null;
                  });
                  log(music?.title != null ? 'yes' : 'no');
                  log(music?.title ?? '');
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(300),
                  ),
                  child: const Icon(
                    Icons.bolt,
                    size: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Tap to Shazam",
              style: GoogleFonts.crimsonPro(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (music?.title != null) ...[
              const SizedBox(height: 20),
              Text(
                music!.title,
                style: GoogleFonts.crimsonPro(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
