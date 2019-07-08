import 'package:ecolecua/model/app_data.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/config_volumen.dart';
import 'package:ecolecua/service/app_config_service.dart';

import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_01.dart';

void main() {
  runApp(new EcolecuaApp(
    title: 'Flutter Redux Demo',
  ));
}

class EcolecuaApp extends StatelessWidget {
  final String title;

  const EcolecuaApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      home: Builder(builder: (context) => inicio(context)),
      routes: {
            '/tutorial/whatsapp' : (context) => Whatsapp01Page()
      },
    );
  }

  Widget inicio(context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: Column(children: [
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Image.asset(
              'assets/images/logo.jpg',
              scale: 2,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            empecemosButton(context),
          ]))),
    );
  }

  Widget empecemosButton(context) {
    return SizedBox(
      height: 50,
      width: 140,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ConfigVolumenPage(
                        new AppConfigService(new AppData()))));
          },
          color: Theme.of(context).primaryColor,
          child: Text("Empecemos", style: TextStyle(color: Colors.white))),
    );
  }
}
