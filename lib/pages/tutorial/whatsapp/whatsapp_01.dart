import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_02.dart';

class Whatsapp01Page extends StatelessWidget {
  
  final AppConfigService appConfigService;

  const Whatsapp01Page({Key key, this.appConfigService}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: PreferredSize(child: AppBar(
          backgroundColor: Colors.green[500],
          title: Text('Paso 1: Presiona el ícono de WhatsApp en la pantalla de inicio de tu celular', style: TextStyle(fontSize: 18.0),maxLines: 3,),
        ),
            preferredSize: Size.fromHeight(80.0)
        ),
        body: Stack(
          alignment: const Alignment(0.3, -0.9),
          children: <Widget>[
       Center(
                child: Image.asset(
                    'assets/images/tutorial/whatsapp/whatsapp-01.png')),
            ButtonTheme(
              minWidth: 80.0,
              height: 80.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Whatsapp02Page(appConfigService: appConfigService)));
                },
                color: Colors.transparent,
              ),
            ),

          ],
        ));
  }

  
}
