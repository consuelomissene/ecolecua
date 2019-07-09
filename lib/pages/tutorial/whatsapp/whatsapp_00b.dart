import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01_video.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01.dart';
import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_00b.dart';

class Whatsapp00bPage extends StatelessWidget {

  final AppConfigService appConfigService;

  const Whatsapp00bPage({Key key, this.appConfigService}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double _fontSize = appConfigService.appData.fontSize;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Center(
          child: Text('Tema 1',
              style: TextStyle(fontSize: _fontSize)),
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
                      MaterialPageRoute(builder: (context) => Whatsapp01VideoPage(appConfigService)),
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
                      MaterialPageRoute(builder: (context) => Whatsapp01Page(appConfigService: appConfigService)),
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
}