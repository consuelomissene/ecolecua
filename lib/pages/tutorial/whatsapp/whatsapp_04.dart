import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_05.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';


class Whatsapp04Page extends StatelessWidget {
  
  final AppConfigService appConfigService;

  const Whatsapp04Page({Key key, this.appConfigService}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: PreferredSize(child: AppBar(
          backgroundColor: Colors.green[500],
          title: Text('Paso 4: Enviar mensaje', style: TextStyle(fontSize: 20.0),maxLines: 3,),
        ),
            preferredSize: Size.fromHeight(80.0)
        ),
        body: Stack(
          alignment: const Alignment(0.85, 0.0),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/whatsapp/whatsapp-04.jpeg')),
            ButtonTheme(
              minWidth: 60.0,
              height: 60.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Whatsapp05Page(appConfigService: appConfigService)));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ));
  }

  
}
