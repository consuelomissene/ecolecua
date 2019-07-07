import 'package:flutter/material.dart';
import 'package:ecolecua/pages/tutorial/whatsapp/whatsapp_02.dart';

class Whatsapp01Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Whatsapp'),
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
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Whatsapp02Page()));
                  },
                  color: Colors.transparent,
                ),
              )
            ],
          )),
    );
  }
}
