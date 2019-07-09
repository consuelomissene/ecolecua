import 'package:ecolecua/pages/home.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

class Whatsapp05Page extends StatefulWidget {
  final AppConfigService appConfigService;

  Whatsapp05Page({Key key, this.appConfigService}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Whatsapp05State();
  }
}

class _Whatsapp05State extends State<Whatsapp05Page> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage(widget.appConfigService))));
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
                    'assets/images/tutorial/whatsapp/whatsapp-05.jpeg')),
          ],
        ));
  }
}
