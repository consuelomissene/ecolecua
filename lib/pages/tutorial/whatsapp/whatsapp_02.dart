import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_03.dart';

class Whatsapp02Page extends StatelessWidget {
  
  final AppConfigService appConfigService;

  const Whatsapp02Page({Key key, this.appConfigService}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: PreferredSize(child: AppBar(
          backgroundColor: Colors.green[500],
          title: Text('Ejercicio 1: Eile hola a ValePony', style: TextStyle(fontSize: 20.0),maxLines: 3,),
        ),
            preferredSize: Size.fromHeight(80.0)
        ),
        body: Stack(
          alignment: const Alignment(0.0, 0.28),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/whatsapp/whatsapp-02.png')),
            ButtonTheme(
              minWidth: 320.0,
              height: 80.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Whatsapp03Page(appConfigService: appConfigService,)));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ));
  }

  
}
