import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/tutorial/facebook/facebook_02.dart';

class Facebook01Page extends StatelessWidget {

  final AppConfigService appConfigService;

  const Facebook01Page({Key key, this.appConfigService}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _fontSize = appConfigService.appData.fontSize;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text('Ejercicio 1:', style: new TextStyle(fontSize: _fontSize)),
        ),
        body: Stack(
          alignment: const Alignment(0.3, -0.9),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/facebook/f1.jpeg')),
            Container(
              padding: EdgeInsets.fromLTRB(70.0, 105.0, 0.0, 0.0),
              child:
              ButtonTheme(
                  minWidth: 210.0,
                  height: 50.0,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Facebook02Page(appConfigService: appConfigService)));
                      },
                      child: Text(''))
              ),
            ),
          ],
        ));
  }


}
