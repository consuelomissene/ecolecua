import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/tutorial/youtube/youtube_03.dart';

class Youtube02Page extends StatelessWidget {

  final AppConfigService appConfigService;

  const Youtube02Page({Key key, this.appConfigService}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
        ),
        body: Stack(
          alignment: const Alignment(0.0, 0.28),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/youtube/y2.jpeg')),
            ButtonTheme(
              minWidth: 320.0,
              height: 80.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Youtube03Page()));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ));
  }


}
