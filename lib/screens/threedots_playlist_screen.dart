import 'package:flutter/material.dart';

class ThreedotsPlaylistScreen extends StatelessWidget {
  const ThreedotsPlaylistScreen({super.key});

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
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,))
                  ],
                ),
                SizedBox(height: 70,),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.scdn.co/image/ab67706c0000da849a31b524409b664e6953359f"))),
                ),
                SizedBox(height: 10,),
                Text("Playlist -1",style: TextStyle(color: Colors.white,fontSize: 20)),
                SizedBox(height: 100,),
                ListTile(leading: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,)),
                title: Text("Add Songs",style: TextStyle(color: Colors.white),),
                ),
                ListTile(leading: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,)),
                title: Text("Edit Playlist",style: TextStyle(color: Colors.white),),
                ),
                 ListTile(leading:IconButton(onPressed: (){
                  showDialog(context: context, builder: (context) {
                   return AlertDialog(
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Yes")),
                          TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("No")),
                      ],
                      content: Text("Do you want to Delete."),
                    );
                  },);
                }, icon: Icon(Icons.delete_forever,color: Colors.white,)),
                title: Text("Delete Playlist",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}