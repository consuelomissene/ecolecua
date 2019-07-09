import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

import 'package:ecolecua/pages/tutorial/facebook/facebook_01.dart';

class Facebook01VideoPage extends StatefulWidget {
  final AppConfigService appConfigService;

  const Facebook01VideoPage(this.appConfigService);

  @override
  _Facebook01VideoState createState() => new _Facebook01VideoState();
}

class _Facebook01VideoState extends State<Facebook01VideoPage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://poc-vvr.s3-us-west-2.amazonaws.com/ecolecua/whatsapp+tutorial.MP4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
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
                    aspectRatio: 1.1,
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
              padding: EdgeInsets.only(top: 15.0),
            ),
            SizedBox(
              height: 50,
              width: 140,
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
}

Widget continuarButton(AppConfigService appConfigService,BuildContext context) {
  return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Facebook01Page(appConfigService: appConfigService)));
      },
      color: Theme.of(context).primaryColor,
      child: Text("Continuar", style: TextStyle(color: Colors.white)));
}
