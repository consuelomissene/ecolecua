import 'package:ecolecua/pages/home.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/youtube/final_y.dart';

class Youtube07Page extends StatefulWidget {
  final AppConfigService appConfigService;

  Youtube07Page({Key key, this.appConfigService}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Youtube07State();
  }
}

class _Youtube07State extends State<Youtube07Page> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => EcolecuaY(widget.appConfigService))));
  }

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
                    'assets/images/tutorial/youtube/y7.jpeg')),
          ],
        ));
  }
}
