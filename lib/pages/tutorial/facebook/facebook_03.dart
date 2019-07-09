import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/tutorial/facebook/facebook_04.dart';

class Facebook03Page extends StatelessWidget {

  final AppConfigService appConfigService;

  const Facebook03Page({Key key, this.appConfigService}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _fontSize = appConfigService.appData.fontSize;
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 1:', style: new TextStyle(fontSize: _fontSize)),
        ),
        body: Stack(
          alignment: const Alignment(0.0, 0.28),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/facebook/f3.jpeg')),
            Container(
              padding: EdgeInsets.fromLTRB(120.0, 310.0, 0.0, 0.0),
              child:
              ButtonTheme(
                  minWidth: 110.0,
                  height: 110.0,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Facebook04Page()),
                        );
                      },
                      child: Text(''))
              ),
            ),
          ],
        ));
  }


}
