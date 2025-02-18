import 'package:ecolecua/pages/home.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:ecolecua/pages/preguntas.dart';
import 'package:ecolecua/service/evaluacion_manager.dart';

class ConocePage extends StatefulWidget {
  final AppConfigService appConfigService;
  const ConocePage(this.appConfigService);
  
  @override
  _ConoceState createState() => new _ConoceState();
}

class _ConoceState extends State<ConocePage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  double _fontSize;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://poc-vvr.s3-us-west-2.amazonaws.com/ecolecua/introduccion.mp4',

    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _fontSize = widget.appConfigService.appData.fontSize;
    super.initState();
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
    _fontSize = widget.appConfigService.appData.fontSize;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0,bottom: 30.0),
              child: Text('Conoce nuestra aplicación:',style: TextStyle(fontSize: _fontSize+5),),
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
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
              padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0, bottom: 60.0),
              child: Text('Puede pausar y continuar el video apretando el'
                  ' botón con forma circular. Además, si lo desea, puede  ladear su celular para ampliar la pantalla, y volverla a enderezar'
                  ' para dejar de ver el video',
              style: TextStyle(fontSize: _fontSize-5),)
            ),
            SizedBox(
              height: 50,
              width:200,
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
          if (appConfigService.appData.tieneEvaluacion != null &&
              appConfigService.appData.tieneEvaluacion) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (BuildContext context) => HomePage(appConfigService)));
                    builder: (BuildContext context) =>
                        PreguntasPage(
                            appConfigService, new EvaluacionManager())));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PreguntasPage(
                            appConfigService, new EvaluacionManager())));
          }
        },
        color: Colors.orangeAccent,
        child: Text("Continuar",
            style: TextStyle(fontSize: _fontSize, color: Colors.white)));
  }
}