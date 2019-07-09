import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_04.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';

class Whatsapp03Page extends StatefulWidget {
  final AppConfigService appConfigService;

  const Whatsapp03Page({Key key, this.appConfigService}) : super(key: key);

  @override
  _Whatsapp03State createState() => new _Whatsapp03State();
}

class _Whatsapp03State extends State<Whatsapp03Page> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
        ),
        body: Stack(
          alignment: const Alignment(0.0, 0.16),
          children: <Widget>[
            Center(
                child: Image.asset(
                    'assets/images/tutorial/whatsapp/whatsapp-03.jpeg')),
            ButtonTheme(
              minWidth: 250.0,
              height: 60.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Whatsapp04Page(appConfigService: widget.appConfigService,)));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ));
  }
}
