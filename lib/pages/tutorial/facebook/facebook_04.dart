import 'package:ecolecua/pages/tutorial/facebook/facebook_05.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';


class Facebook04Page extends StatelessWidget {

  final AppConfigService appConfigService;

  const Facebook04Page({Key key, this.appConfigService}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
        ),
        body: Stack(
          alignment: const Alignment(0.85, 0.0),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/facebook/f4.jpeg')),
            ButtonTheme(
              minWidth: 60.0,
              height: 60.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Facebook05Page(appConfigService: appConfigService)));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ));
  }


}
