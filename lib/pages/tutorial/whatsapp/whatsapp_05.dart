import 'package:ecolecua/pages/home.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/whatsapp/final_w.dart';
import 'dart:async';
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
    Timer(const Duration(seconds: 2), onClose);
  }
  void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => EcolecuaW(widget.appConfigService),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
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
