import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


main() => runApp(MusicPlayer());

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
      
      
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AudioPlayer _audio = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime= "00:00";

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.queue_music), onPressed: null),
          ],
          title: Center(
            child: Text(
              'Music Player', 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 24,
                color: Colors.deepPurple,
                ),
                ),
                ),
                backgroundColor: Colors.white54,
                elevation: 30,
                brightness: Brightness.dark,

        ),
        body: Container(
          color: Colors.indigoAccent.shade100,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(0),
          
          child: Stack(
            
          alignment: Alignment.topCenter,
            children: <Widget>[
              Container(               
                margin: EdgeInsets.only(top: 30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: NetworkImage('https://cdn.domtotal.com/img/noticias/2017-08/1177448_323913.jpg',), fit: BoxFit.fill,),
                  ),
              ),
              Container(
                height: double.infinity,
                 width: double.infinity,
                 //color: Colors.red,      
                 child: Center(child: Text('FEEL THE MUSIC', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),))                          
              ),
              Container(
                
                margin: EdgeInsets.only(top: 340.0),
                width: 100,
                //color: Colors.blue,
                child: Row( 
                  
                  
                  children: <Widget>[
                    IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black87, size: 60,),
                  onPressed: (){
                    if(isPlaying){
                      _audio.pause();

                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      _audio.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                )  ,
                IconButton(
                  icon: Icon(Icons.stop, color: Colors.black87, size: 60,),
                  onPressed: (){
                    _audio.stop();

                    setState(() {
                      isPlaying = false;
                    });

                  },
                ),

                  ],
                )
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.music_note),backgroundColor: Colors.black87, onPressed: () async {
          String path = await FilePicker.getFilePath();
          int status = await _audio.play(path, isLocal: true);
            if(status == 1){
            setState(() {
              isPlaying = true;
            });
            }
        }),
    );
  }
}




