import 'package:ecolecua/pages/tutorial/youtube/youtube_05.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';


class Youtube04Page extends StatelessWidget {

  final AppConfigService appConfigService;

  const Youtube04Page({Key key, this.appConfigService}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _fontSize;
    _fontSize=appConfigService.appData.fontSize;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent[400],
          title: Text(
            'Ejercicio 1: Busca un video de Chayanne',
            style: TextStyle(fontSize: _fontSize), maxLines: 3,
          ),
        ),
        body: Stack(
          alignment: const Alignment(0.85, 0.0),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/youtube/y4.jpeg')),
            ButtonTheme(
              minWidth: 60.0,
              height: 60.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Youtube05Page(appConfigService: appConfigService)));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ));
  }


}
