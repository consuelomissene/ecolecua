import 'package:ecolecua/pages/tutorial/youtube/youtube_01_video.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/youtube/youtube_01.dart';
import 'package:ecolecua/pages/tutorial/facebook/facebook_00b.dart';

class Youtube00bPage extends StatelessWidget {
  final AppConfigService appConfigService;

  const Youtube00bPage({Key key, this.appConfigService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _fontSize = appConfigService.appData.fontSize;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child:  AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text('Tema 1: Cómo publicar una imagen',
            style: TextStyle(fontSize: _fontSize),
            maxLines: 2,
          ),

        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,180.0,0,0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Deseas ver el video?', style: TextStyle(fontSize: _fontSize)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RaisedButton(
                  color:Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Youtube01VideoPage(appConfigService)),
                    );
                  },
                  child: Text('Sí',
                      style:
                      TextStyle(fontSize: _fontSize, color: Colors.white)),
                  elevation: 20.0,
                ),
                RaisedButton(
                  color: Colors.redAccent[700],
                  child: Text('No',
                      style:
                      TextStyle(fontSize: _fontSize, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Youtube01Page(appConfigService: appConfigService)),
                    );
                  },
                  elevation: 20.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
} //Tema 1 Facebook
