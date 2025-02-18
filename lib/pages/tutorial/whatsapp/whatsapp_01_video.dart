import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01.dart';

class Whatsapp01VideoPage extends StatefulWidget {
  final AppConfigService appConfigService;

  const Whatsapp01VideoPage(this.appConfigService);
  
  @override
  _Whatsapp01VideoState createState() => new _Whatsapp01VideoState();
}

class _Whatsapp01VideoState extends State<Whatsapp01VideoPage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  double _fontSize;

  @override
  void initState() {
    
    // https://poc-vvr.s3-us-west-2.amazonaws.com/ecolecua/whatsapp+tutorial.mp4
    super.initState();
    _controller = VideoPlayerController.network(
      'https://poc-vvr.s3-us-west-2.amazonaws.com/ecolecua/whatsapp+tutorial.mp4',

    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _fontSize = widget.appConfigService.appData.fontSize;
  }

  @override
  void dispose() {
    print('dispose');
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Colors.green[500],
          title: Text('Tema 1: Cómo enviar un mensaje',style: TextStyle(fontSize: _fontSize),)),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: 0.84,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Padding(
                padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0, bottom: 80.0),
                child: Text('Puede pausar y continuar el video apretando el'
                    ' botón con forma circular. Además, si lo desea, puede  ladear su celular para ampliar la pantalla, y volverla a enderezar'
                    ' para dejar de ver el video',
                  style: TextStyle(fontSize: _fontSize-5),)
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: continuarButton(widget.appConfigService, context),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }


  Widget continuarButton(AppConfigService appConfigService,
      BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Whatsapp01Page(appConfigService: appConfigService)));
        },
        color:  Colors.green[500],
        child: Text("Ir a ejercitar",
            style: TextStyle(fontSize: _fontSize, color: Colors.white)));
  }
}