import 'package:ecolecua/model/screen_arguments.dart';
import 'package:ecolecua/service/app_config_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'Config.dart';

class HomePage extends StatelessWidget {

  final AppConfigService appConfigService;
  HomePage(this.appConfigService);

  @override
  Widget build(BuildContext context) {
    double _fontSize = appConfigService.appData.fontSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[400],
        title: Text(
          'Ecolecuá',
          style: TextStyle(fontSize: 40.0),
        ),
        bottom: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.orangeAccent[400],
              automaticallyImplyLeading: false,
              actions: <Widget>[
                ButtonTheme(
                  buttonColor: Colors.orangeAccent[100],
                  minWidth: 60.0,
                  height: 30.0,
                  child: RaisedButton(
                    onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ConfiguracionPage(appConfigService)),
                      );
                    },
                    color: Colors.orangeAccent[100],
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
// Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.settings),
                        Text(
                          "Configuración",
                          style: TextStyle(fontSize: _fontSize),
                        ),
                      ],
                    ),
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: Colors.orangeAccent[100],
                    shape:
                    CircleBorder(side: BorderSide(color: Colors.black38)),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.volume_off),
                    color: Colors.black,
                    onPressed: () {
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.redAccent[700],
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
// return object of type Dialog
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                          title: Text("Salir de la aplicación"),
                          content: Text("¿Deseas salir?",
                              style: TextStyle(fontSize: 20.0)),
                          actions: <Widget>[
                            RaisedButton(
                              color: Colors.green,
                              child: Text('No',
                                  style: TextStyle(
                                      fontSize: _fontSize,
                                      color: Colors.white)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ), // usually buttons at the bottom of the dialog
                            RaisedButton(
                              color: Colors.redAccent[700],
                              child: Text('Sí',
                                  style: TextStyle(
                                      fontSize: _fontSize,
                                      color: Colors.white)),
                              onPressed: () => exit(0),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.close),
                  label: Text(
                    'Salir',
                    style: TextStyle(fontSize: _fontSize),
                  ),
                  elevation: 20.0,
                ),
              ],
            ),
            preferredSize: Size.fromHeight(80.0)),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                  child: Text('¿Qué red social deseas aprender hoy?',
                      style: TextStyle(
                          fontSize: _fontSize + 3.0,
                          fontWeight: FontWeight.w500)))),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              children: List.generate(botones.length, (index) {
                return Center(
                  child: ChoiceCard(
                      appConfigService: appConfigService,
                      boton: botones[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {

  ChoiceCard({Key key, this.boton, this.appConfigService}) : super(key: key);
  final Boton boton;
  final AppConfigService appConfigService;

  @override
  Widget build(BuildContext context) {
    double _fontSize = appConfigService.appData.fontSize;
    return RaisedButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: boton.color,
      splashColor: Colors.transparent,
      child: Column(children: [
        Image(
            image: AssetImage(boton.logo),
            semanticLabel: boton.sem,
            alignment: Alignment.topCenter,
            width: 165.0,
            height: 125.0),
        Text(boton.title,
            style: new TextStyle(fontSize: _fontSize, color: boton.colorin))
      ]),
      onPressed: () {
        Navigator.pushNamed(context, boton.route,
            arguments: ScreenArguments(appConfigService));
      },
    );
  }
}

class Boton {
  const Boton(
      {this.title,
        this.logo,
        this.label,
        this.route,
        this.color,
        this.sem,
        this.colorin});

  final String title;
  final String logo;
  final String label;
  final String route;
  final Color color;
  final Color colorin;
  final String sem;
}

const List<Boton> botones = const <Boton>[
  const Boton(
      title: 'Facebook',
      logo: "assets/images/app_logos/facebook.jpg",
      label: "Logo de Facebook",
      route: '/tutorial/facebook',
      color: Color(0xFF01579B),
      colorin: Colors.white,
      sem: 'Botón a menú de Facebook'),
  const Boton(
      title: 'WhatsApp',
      logo: "assets/images/app_logos/whatsapp.jpg",
      label: "Logo de WhatsApp",
      route: '/tutorial/whatsapp',
      color: Color(0xFF00C853),
      colorin: Colors.white,
      sem: 'Botón a menú de whatsapp'),
  const Boton(
      title: 'Youtube',
      logo: "assets/images/app_logos/youtube.jpg",
      label: "Logo de Youtube",
      route: '/tutorial/youtube',
      color: Colors.white,
      colorin: Colors.black,
      sem: 'botón a menú de Youtube'),
];
