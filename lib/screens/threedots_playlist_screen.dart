import 'package:flutter/material.dart';
import 'package:project_main/model/playlist/playlist_function.dart';
import 'package:project_main/screens/playlist_screen.dart';


// ignore: must_be_immutable
class ThreedotsPlaylistScreen extends StatelessWidget {
  int index;
  BuildContext? ctx;
  String playListname;
  // int playListIndex;
 ThreedotsPlaylistScreen({super.key,required this.index,this.ctx,required this.playListname});

final renameController = TextEditingController();
final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,))
                    ],
                  ),
                  const SizedBox(height: 70,),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.scdn.co/image/ab67706c0000da849a31b524409b664e6953359f"))),
                  ),
                  const SizedBox(height: 10,),
                   Text(playListname,style: const TextStyle(color: Colors.white,fontSize: 20)),
                  const SizedBox(height: 100,),
                  ListTile(leading: IconButton(onPressed: (){}, icon: const Icon(Icons.add,color: Colors.white,)),
                  title: const Text("Add Songs",style: TextStyle(color: Colors.white),),
                  ),
                  GestureDetector(
                    onTap: () {
                     showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Form(
                        key: formkey,
                        child: TextFormField(
                          controller: renameController,
                          // ignore: body_might_complete_normally_nullable
                          validator: (_) {
                            if (renameController.text.trim().isEmpty ||
                                PlayListNotifier.value.any((playlist) =>
                                    playlist.name == renameController.text)) {
                              return 'Name is empty or already present';
                            }
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              filled: true,
                              fillColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              labelText: 'Enter new Play List name'),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Navigator.pop(context);
                                playListRename(
                                    index, renameController.text);
                                renameController.clear();
                  
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Enter'))
                      ],
                    );
                  },
                              );
                    },
                    child: ListTile(leading: IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.white,)),
                    title: const Text("Edit Playlist",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                   GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                     return AlertDialog(
                        actions: [
                          TextButton(onPressed: (){
                           deletePlayList(index);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PlaylistScreen(),), (route) => false);
                          }, child: const Text("Yes")),
                            TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: const Text("No")),
                        ],
                        content: const Text("Do you want to Delete."),
                      );
                    },);
                    },
                     child: ListTile(leading:IconButton(onPressed: () {
                       
                     },
                     icon: const Icon(Icons.delete_forever,color: Colors.white,)),
                                     title: const Text("Delete Playlist",style: TextStyle(color: Colors.white),),
                                     ),
                   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}